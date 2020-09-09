import re

pattern = re.compile(
        r'(\d{4} \w{3}\s+\d{1,2} \d{1,2}:\d{1,2}:\d{1,2}|'
        r'\w{3}\s+\d{1,2} \d{1,2}:\d{1,2}:\d{1,2}\.\d{1,10}|'
        r'\w{3}\s+\d{1,2} \d{4} \d{1,2}:\d{1,2}:\d{1,2}\.\d{1,10}).*?:|'
        r'(\w{3}\s+\d{1,2} \d{1,2}:\d{1,2}:\d{1,2}).*?\s+|'
        r'.*?,.*?,.*?,SYSTEM,(?P<tag1>.*?),.*?,.*?,.*?,(?P<tag2>.*?),.*?'
        r'(?P<level>informational|low|medium|high|critical),(?P<msg>.*?),'
    )

inps= ['<12>Sep 8 06:20:29 SYD-01-01-FWE01.hq.k.grp 1,2020/09/08 06:20:29,009401003504,SYSTEM,userid,0,2020/09/08 06:20:29,,connect-ldap-sever-failure,10.1.160.134,0,0,general,medium,ldap cfg DYN_USR_PU_CAS-groupmapping failed to connect to server 10.1.160.134:636: Error: Failed to connect to 10.1.160.134(10.1.160.134):636Error: Failed to connect to 10.1.160.134(10.1.160.134):636,15782852,0x8000000000000000,0,0,0,0,,SYD-01-01-FWE01',
'<86>Sep 8 08:10:01 adminsw-dc1r07n01 CRON[19035]: pam_unix(cron:session): session opened for user prometheus by (uid=0)',
'<14>Sep 8 12:57:49 MUM-01-01-FWE01.hq.k.grp 1,2020/09/08 12:57:49,009401002728,SYSTEM,dnsproxy,0,2020/09/08 12:57:49,,resolve-fail,mgmt-obj,0,0,general,informational,Failed to resolve domain name:atl-nas-01.hq.k.grp after trying all attempts to name server(s): 10.128.4.15 10.12.20.59 ,7169133,0x0,0,0,0,0,,MUM-01-01-FWE01',
'<14>Sep 8 12:57:49 MUM-01-01-FWE01.hq.k.grp 1,2020/09/08 12:57:49,009401002728,SYSTEM,dnsproxy,0,2020/09/08 12:57:49,,resolve-fail,mgmt-obj,0,0,general,informational,Failed to resolve domain name:atl-nas-01.hq.k.grp after trying all attempts to name server(s): 10.128.4.15 10.12.20.59 ,7169133,0x0,0,0,0,0,,MUM-01-01-FWE01']

for inp in inps:
    delimiter = pattern.search(inp)

    groupindex = pattern.groupindex
    data = {
        'event': "event",
        'message': "message",
    }

    if (delimiter.groups()[groupindex.get('tag1') - 1] and delimiter.groups()[groupindex.get('tag2') - 1]):
        data['level_tag'] = f'SYSTEM {delimiter.groups()[groupindex.get("tag1") - 1]} {delimiter.groups()[groupindex.get("tag2") - 1]}'

    if delimiter.groups()[groupindex.get('level') - 1]:
        data['level'] = delimiter.groups()[groupindex.get('level') - 1]

    if delimiter.groups()[groupindex.get('msg') - 1]:
        data['message'] = delimiter.groups()[groupindex.get('msg') - 1]


    print(data)
    print()

