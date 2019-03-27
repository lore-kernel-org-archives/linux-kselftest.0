From: pvorel at suse.cz (Petr Vorel)
Date: Wed, 27 Mar 2019 12:53:27 +0100
Subject: [PATCH v5 8/9] selftests/kexec: check kexec_load and
 kexec_file_load are enabled
In-Reply-To: <1553607257-18906-9-git-send-email-zohar@linux.ibm.com>
References: <1553607257-18906-1-git-send-email-zohar@linux.ibm.com>
 <1553607257-18906-9-git-send-email-zohar@linux.ibm.com>
Message-ID: <20190327115327.GB13687@dell5510>

Hi Mimi, Dave,

> Skip the kexec_load and kexec_file_load tests, if they aren't configured
> in the kernel.  This change adds a new requirement that ikconfig is
> configured in the kexec_load test.

> Suggested-by: Dave Young <dyoung at redhat.com>
> Signed-off-by: Mimi Zohar <zohar at linux.ibm.com>
Reviewed-by: Petr Vorel <pvorel at suse.cz>


Kind regards,
Petr
