# Recovery Testing Procedure

## Test Frequency
- Quarterly full recovery test
- Monthly file-level restore test

## Test Steps
1. Select a random file from last backup
2. Restore to isolated test environment
3. Verify file integrity and permissions
4. Measure restore time (compare to RTO)

## Database Recovery Test
1. Restore MySQL backup to test server
2. Verify data completeness with checksums
3. Test application connectivity to restored DB

## Failover Test (DR)
1. Shut down primary environment (or disconnect)
2. Activate DR environment
3. Verify application functionality
4. Document failover time (RTO)
5. Fail back to primary

## Documentation
- Record all test results
- Document any issues and resolutions
- Update recovery procedures as needed
