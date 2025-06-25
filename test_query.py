#!/usr/bin/env python3
"""
Quick test script for Databricks queries
Usage: python test_query.py path/to/query.sql
"""

import os
import sys
from databricks_query_tester import DatabricksQueryTester


def quick_test(query_file: str, limit: int = 10):
    """Quick test a query file"""
    # Get credentials from environment
    server_hostname = os.getenv("DATABRICKS_SERVER_HOSTNAME")
    http_path = os.getenv("DATABRICKS_HTTP_PATH")
    access_token = os.getenv("DATABRICKS_TOKEN")
    
    if not all([server_hostname, http_path, access_token]):
        print("Error: Missing Databricks credentials in environment")
        print("Set: DATABRICKS_SERVER_HOSTNAME, DATABRICKS_HTTP_PATH, DATABRICKS_TOKEN")
        sys.exit(1)
    
    tester = DatabricksQueryTester(server_hostname, http_path, access_token)
    
    try:
        tester.connect()
        df = tester.test_query_file(query_file, limit)
        print("\nSample results:")
        print(df.head())
        print(f"\nShape: {df.shape}")
        print(f"Columns: {list(df.columns)}")
    finally:
        tester.disconnect()


if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Usage: python test_query.py path/to/query.sql")
        sys.exit(1)
    
    quick_test(sys.argv[1])