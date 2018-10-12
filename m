From: dan.carpenter at oracle.com (Dan Carpenter)
Date: Fri, 12 Oct 2018 11:53:54 +0300
Subject: [bug report] Fix cg_read_strcmp()
Message-ID: <20181012085354.GA25186@mwanda>

Hello Jay Kamat,

This is a semi-automatic email about new static checker warnings.

The patch 48c2bb0b9cf8: "Fix cg_read_strcmp()" from Sep 7, 2018,
leads to the following Smatch complaint:

    ./tools/testing/selftests/cgroup/cgroup_util.c:111 cg_read_strcmp()
    error: we previously assumed 'expected' could be null (see line 97)

./tools/testing/selftests/cgroup/cgroup_util.c
    96		/* Handle the case of comparing against empty string */
    97		if (!expected)
                     ^^^^^^^^
Originally, we assumed that expected was non-NULL but we added a check
here.  I feel like maybe the intention was to check was supposed to be:

	if (expected[0] == '\0')

but that's just a random guess.

    98			size = 32;
    99		else
   100			size = strlen(expected) + 1;
   101	
   102		buf = malloc(size);
   103		if (!buf)
   104			return -1;
   105	
   106		if (cg_read(cgroup, control, buf, size)) {
   107			free(buf);
   108			return -1;
   109		}
   110	
   111		ret = strcmp(expected, buf);
                             ^^^^^^^^
Unchecked dereference.

   112		free(buf);
   113		return ret;

regards,
dan carpenter
