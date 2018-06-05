From: davem@davemloft.net (David Miller)
Date: Tue, 05 Jun 2018 14:28:40 -0400 (EDT)
Subject: [PATCH v6 0/2] sparc64: Add privileged ADI driver
In-Reply-To: <20180426165409.716764-1-tom.hromatka@oracle.com>
References: <20180426165409.716764-1-tom.hromatka@oracle.com>
Message-ID: <20180605.142840.2277897500494503602.davem@davemloft.net>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180605182840.laWof6CoUGVE2j-n091lEX9FqrkZVnhUJDxLFeGNffM@z>

From: Tom Hromatka <tom.hromatka@oracle.com>
Date: Thu, 26 Apr 2018 10:54:07 -0600

> ADI is a feature supported on SPARC M7 and newer processors to allow
> hardware to catch rogue accesses to memory. ADI is supported for data
> fetches only and not instruction fetches. An app can enable ADI on its
> data pages, set version tags on them and use versioned addresses to
> access the data pages. Upper bits of the address contain the version
> tag. On M7 processors, upper four bits (bits 63-60) contain the version
> tag. If a rogue app attempts to access ADI enabled data pages, its
> access is blocked and processor generates an exception. Please see
> Documentation/sparc/adi.txt for further details.
> 
> This patchset implements a char driver to read/write ADI versions from
> privileged user space processes.  Intended consumers are makedumpfile
> and crash.

Series applied, but there is one thing I am not happy with.

The hard coded ADI block size.

This value is at least theoretically dynamic, and that is why
it is passed into userspace programs via the ELF AUX vector
at exec() time.

So they should really fetch it from there.
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
