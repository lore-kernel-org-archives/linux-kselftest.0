From: pvorel@suse.cz (Petr Vorel)
Date: Wed, 27 Mar 2019 12:56:33 +0100
Subject: [PATCH v5 9/9] selftests/kexec: make kexec_load test independent
 of IMA being enabled
In-Reply-To: <1553607257-18906-10-git-send-email-zohar@linux.ibm.com>
References: <1553607257-18906-1-git-send-email-zohar@linux.ibm.com>
 <1553607257-18906-10-git-send-email-zohar@linux.ibm.com>
Message-ID: <20190327115632.GA15385@dell5510>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190327115633.xgR3LY-FGxhN6Do3f35QBIuReVUIZ-y7mgs8b0ByQnE@z>

Hi Mimi, Dave,

> Verify IMA is enabled before failing tests or emitting irrelevant
> messages.

> Suggested-by: Dave Young <dyoung at redhat.com>
> Signed-off-by: Mimi Zohar <zohar at linux.ibm.com>
> Reviewed-by: Dave Young <dyoung at redhat.com>
Reviewed-by: Petr Vorel <pvorel at suse.cz>

Kind regards,
Petr
