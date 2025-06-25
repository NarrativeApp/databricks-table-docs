#!/usr/bin/env python3
"""
Simple Databricks Query Tester
Provides a lightweight way to test and iterate on SQL queries against Databricks
"""

import os
import sys
import json
import argparse
from datetime import datetime
from typing import Optional, Dict, Any, List
import pandas as pd
from pathlib import Path

try:
    from databricks import sql
except ImportError:
    print("Error: databricks-sql-connector not installed")
    print("Run: pip install databricks-sql-connector")
    sys.exit(1)


class DatabricksQueryTester:
    """Simple interface for testing Databricks queries"""
    
    def __init__(self, server_hostname: str, http_path: str, access_token: str):
        """Initialize connection parameters"""
        self.server_hostname = server_hostname
        self.http_path = http_path
        self.access_token = access_token
        self.connection = None
        self.cursor = None
    
    def connect(self):
        """Establish connection to Databricks"""
        try:
            self.connection = sql.connect(
                server_hostname=self.server_hostname,
                http_path=self.http_path,
                access_token=self.access_token
            )
            self.cursor = self.connection.cursor()
            print("✓ Connected to Databricks")
        except Exception as e:
            print(f"✗ Connection failed: {e}")
            raise
    
    def disconnect(self):
        """Close connection"""
        if self.cursor:
            self.cursor.close()
        if self.connection:
            self.connection.close()
        print("✓ Disconnected from Databricks")
    
    def run_query(self, query: str, limit: Optional[int] = None) -> pd.DataFrame:
        """Execute query and return results as DataFrame"""
        if limit:
            query = f"{query.rstrip(';')} LIMIT {limit}"
        
        print(f"Executing query...")
        start_time = datetime.now()
        
        try:
            self.cursor.execute(query)
            columns = [desc[0] for desc in self.cursor.description]
            rows = self.cursor.fetchall()
            
            execution_time = (datetime.now() - start_time).total_seconds()
            print(f"✓ Query executed in {execution_time:.2f} seconds")
            print(f"✓ Returned {len(rows)} rows")
            
            return pd.DataFrame(rows, columns=columns)
        
        except Exception as e:
            print(f"✗ Query failed: {e}")
            raise
    
    def test_query_file(self, file_path: str, limit: Optional[int] = 10) -> pd.DataFrame:
        """Read query from file and test it"""
        path = Path(file_path)
        if not path.exists():
            raise FileNotFoundError(f"Query file not found: {file_path}")
        
        print(f"\nTesting query from: {file_path}")
        
        with open(path, 'r') as f:
            query = f.read()
        
        # Remove dbt refs for testing (basic replacement)
        query = query.replace("{{ ref('", "").replace("') }}", "")
        
        return self.run_query(query, limit)
    
    def validate_query(self, query: str) -> bool:
        """Validate query syntax without executing"""
        try:
            # Add EXPLAIN to validate without executing
            explain_query = f"EXPLAIN {query}"
            self.cursor.execute(explain_query)
            print("✓ Query syntax is valid")
            return True
        except Exception as e:
            print(f"✗ Query validation failed: {e}")
            return False


def load_config(config_path: str = ".databricks_config.json") -> Dict[str, str]:
    """Load connection config from file"""
    if os.path.exists(config_path):
        with open(config_path, 'r') as f:
            return json.load(f)
    return {}


def save_config(config: Dict[str, str], config_path: str = ".databricks_config.json"):
    """Save connection config to file"""
    with open(config_path, 'w') as f:
        json.dump(config, f, indent=2)
    print(f"✓ Config saved to {config_path}")


def main():
    parser = argparse.ArgumentParser(description="Test Databricks SQL queries")
    parser.add_argument("query", nargs="?", help="SQL query or path to .sql file")
    parser.add_argument("--limit", type=int, default=10, help="Limit rows returned (default: 10)")
    parser.add_argument("--validate-only", action="store_true", help="Only validate syntax, don't execute")
    parser.add_argument("--save-config", action="store_true", help="Save connection details for future use")
    parser.add_argument("--output", help="Save results to CSV file")
    
    args = parser.parse_args()
    
    # Load existing config
    config = load_config()
    
    # Get connection details from environment or config
    server_hostname = os.getenv("DATABRICKS_SERVER_HOSTNAME", config.get("server_hostname", ""))
    http_path = os.getenv("DATABRICKS_HTTP_PATH", config.get("http_path", ""))
    access_token = os.getenv("DATABRICKS_TOKEN", config.get("access_token", ""))
    
    # Prompt for missing values
    if not server_hostname:
        server_hostname = input("Databricks server hostname: ")
    if not http_path:
        http_path = input("HTTP path: ")
    if not access_token:
        access_token = input("Access token: ")
    
    # Save config if requested
    if args.save_config:
        config = {
            "server_hostname": server_hostname,
            "http_path": http_path,
            "access_token": access_token
        }
        save_config(config)
    
    # Initialize tester
    tester = DatabricksQueryTester(server_hostname, http_path, access_token)
    
    try:
        tester.connect()
        
        if not args.query:
            # Interactive mode
            print("\nEntering interactive mode. Type 'exit' to quit.")
            while True:
                query = input("\nSQL> ").strip()
                if query.lower() == 'exit':
                    break
                if query:
                    try:
                        df = tester.run_query(query, args.limit)
                        print("\nResults:")
                        print(df)
                    except Exception as e:
                        print(f"Error: {e}")
        else:
            # Single query mode
            if args.query.endswith('.sql'):
                # File mode
                df = tester.test_query_file(args.query, args.limit)
            else:
                # Direct query mode
                if args.validate_only:
                    tester.validate_query(args.query)
                else:
                    df = tester.run_query(args.query, args.limit)
            
            if not args.validate_only:
                print("\nResults:")
                print(df)
                
                if args.output:
                    df.to_csv(args.output, index=False)
                    print(f"\n✓ Results saved to {args.output}")
    
    finally:
        tester.disconnect()


if __name__ == "__main__":
    main()