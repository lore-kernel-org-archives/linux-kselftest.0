From: dan.carpenter@oracle.com (Dan Carpenter)
Date: Thu, 17 May 2018 16:22:25 +0300
Subject: [bug report] selftests: cgroup: add memory controller self-tests
Message-ID: <20180517132225.GA13289@mwanda>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180517132225.z9HwooafxKPPBR99icif1byFFEPpq4CNvJ8b5QDTAr8@z>

Hello Roman Gushchin,

The patch a62213fe9b77: "selftests: cgroup: add memory controller
self-tests" from May 11, 2018, leads to the following static checker
warning:

	./tools/testing/selftests/cgroup/cgroup_util.c:62 cg_name()
	warn: variable dereferenced before check 'name' (see line 59)

./tools/testing/selftests/cgroup/cgroup_util.c
    57  char *cg_name(const char *root, const char *name)
    58  {
    59          size_t len = strlen(root) + strlen(name) + 2;
                                            ^^^^^^^^^^^^
    60          char *ret = malloc(len);
    61  
    62          if (name)
                    ^^^^
    63                  snprintf(ret, len, "%s/%s", root, name);
    64  
    65          return ret;
    66  }
    67  
    68  char *cg_name_indexed(const char *root, const char *name, int index)
    69  {
    70          size_t len = strlen(root) + strlen(name) + 10;
                                            ^^^^^^^^^^^^
    71          char *ret = malloc(len);
    72  
    73          if (name)
                    ^^^^
    74                  snprintf(ret, len, "%s/%s_%d", root, name, index);
    75  
    76          return ret;
    77  }

regards,
dan carpenter
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
