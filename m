From: shuahkh at osg.samsung.com (Shuah Khan)
Date: Tue, 13 Feb 2018 14:28:04 -0700
Subject: [PATCH] selftests/x86: Remove 5lvl test from Makefile
In-Reply-To: <20180208075148.gpxuve4cwwcp2etb@node.shutemov.name>
References: <1518069029-22457-1-git-send-email-daniel.diaz@linaro.org>
 <20180208075148.gpxuve4cwwcp2etb@node.shutemov.name>
Message-ID: <a07c63af-adbf-142e-eaeb-079eb0ead9a3@osg.samsung.com>

On 02/08/2018 12:51 AM, Kirill A. Shutemov wrote:
> On Wed, Feb 07, 2018 at 11:50:28PM -0600, Daniel Díaz wrote:
>> The 5lvl.c test file was incorporated into another one in
>> selftests/vm (va_128TBswitch.c) in commit 235266b8.
>>
>> Signed-off-by: Daniel Díaz <daniel.diaz at linaro.org>
> 
> Acked-by: Kirill A. Shutemov <kirill.shutemov at linux.intel.com>
> 

Thanks. Applied to linux-kselftest fixes for 4.16-rc3.

thanks,
-- Shuah
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
