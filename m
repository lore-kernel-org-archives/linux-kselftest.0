From: david at fromorbit.com (Dave Chinner)
Date: Mon, 1 Oct 2018 14:08:21 +1000
Subject: [PATCH 0/3] namei: implement various scoping AT_* flags
In-Reply-To: <20180929103453.12025-1-cyphar@cyphar.com>
References: <20180929103453.12025-1-cyphar@cyphar.com>
Message-ID: <20181001040821.GP31060@dastard>

On Sat, Sep 29, 2018 at 08:34:50PM +1000, Aleksa Sarai wrote:
> I've added some selftests for this, but it's not clear to me whether
> they should live here or in xfstests (as far as I can tell there are no
> other VFS tests in selftests, while there are some tests that look like
> generic VFS tests in xfstests). If you'd prefer them to be included in
> xfstests, let me know.

xfstests, please. That way the new functionality will get immediate
coverage by all the main filesystem development and distro QA
teams....

Cheers,

Dave.
-- 
Dave Chinner
david at fromorbit.com
