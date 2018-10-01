From: cyphar at cyphar.com (Aleksa Sarai)
Date: Mon, 1 Oct 2018 15:47:23 +1000
Subject: [PATCH 0/3] namei: implement various scoping AT_* flags
In-Reply-To: <20181001040821.GP31060@dastard>
References: <20180929103453.12025-1-cyphar@cyphar.com>
 <20181001040821.GP31060@dastard>
Message-ID: <20181001054723.lekp3nqgctdyly7m@ryuk>

On 2018-10-01, Dave Chinner <david at fromorbit.com> wrote:
> > I've added some selftests for this, but it's not clear to me whether
> > they should live here or in xfstests (as far as I can tell there are no
> > other VFS tests in selftests, while there are some tests that look like
> > generic VFS tests in xfstests). If you'd prefer them to be included in
> > xfstests, let me know.
> 
> xfstests, please. That way the new functionality will get immediate
> coverage by all the main filesystem development and distro QA
> teams....

Sure, will do. Do you want me to submit them in parallel -- and what is
the correct ML to submit changes to xfstests? Sorry for the silly
questions. :P

-- 
Aleksa Sarai
Senior Software Engineer (Containers)
SUSE Linux GmbH
<https://www.cyphar.com/>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 833 bytes
Desc: not available
URL: <http://lists.linaro.org/pipermail/linux-kselftest-mirror/attachments/20181001/423674c4/attachment.sig>
