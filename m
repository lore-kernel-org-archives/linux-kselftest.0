From: shuah@kernel.org (Shuah Khan)
Date: Thu, 24 May 2018 10:41:06 -0600
Subject: [PATCH] selftests: intel_pstate: Fixes for the testing script for
 Intel P-State driver
In-Reply-To: <20180522170505.5846-1-ahiliation@yahoo.co.in>
References: <20180522170505.5846-1-ahiliation@yahoo.co.in>
Message-ID: <620f060d-afab-e79c-43a6-3024d728157a@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180524164106.b88X6kLmKl4GWQIEn01XsYS9n2ErGFttYsb75OiX5bE@z>

Hi Jeffrin,

On 05/22/2018 11:05 AM, Jeffrin Jose T wrote:
> fix for notification of permission requirement to run test.
> fix for exit status value for test skipped.
> 
> Signed-off-by: Jeffrin Jose T <jeffrin at rajagiritech.edu.in>

The commit log doesn't match the commit summary. Please rephrase both the
commit summary and log to indicate why this fix is necessary.

Odd. I don't see your patch posted on the linux-kselftest patchwork and not
even on lkml archive. 

You signed off doesn't match your from. Are you using git send-email to send
patches?

thanks,
-- Shuah
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
