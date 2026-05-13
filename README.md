# Network Security Project
## Vulnerability Assessment - OpenVAS/Greenbone

Vulnerability assessment project based on **OpenVAS/Greenbone** for identifying, analyzing, and reporting security weaknesses in networked systems.

## Overview

This repository contains materials and notes for a university network security project focused on:

- Setting up a Greenbone/OpenVAS environment
- Running vulnerability scans on target hosts/services
- Reviewing and classifying findings by severity
- Producing a final assessment report with mitigation suggestions

## Objectives

- Learn practical vulnerability assessment workflows
- Understand CVSS-based risk prioritization
- Improve security posture through actionable remediation steps

## Tools

- **OpenVAS / Greenbone Vulnerability Manager (GVM)** VM
- Debian VM
- Windows XP VM

## Suggested Project Workflow

1. **Environment setup**
	- Install and initialize OpenVAS/GVM
	- Verify scanner, manager, and web UI services

2. **Target definition**
	- Define hosts/subnets to scan
	- Configure credentials (if authenticated scanning is required)

3. **Scan configuration and execution**
	- Select an appropriate scan profile
	- Launch scans and monitor progress

4. **Result analysis**
	- Review vulnerabilities by severity (Critical/High/Medium/Low)
	- Validate key findings and remove false positives when needed

5. **Reporting**
	- Export results
	- Summarize major risks and propose mitigation actions

## Example Report Structure

- Scope and assumptions
- Methodology
- Identified vulnerabilities
- Risk evaluation
- Recommended remediations
- Conclusion

## Authors
- @wr3nch623 Marco Fagnani
- @ozneroL541 Lorenzo Radice

## License
Copyright (C) 2026  Marco Fagnani, Lorenzo Radice

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <https://www.gnu.org/licenses/>.

