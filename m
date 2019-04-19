From: shuah at kernel.org (shuah)
Date: Fri, 19 Apr 2019 07:19:52 -0600
Subject: [PATCHv2] selftests/efivarfs: clean up test files from
 test_create*()
In-Reply-To: <20190419131221.28297-1-po-hsu.lin@canonical.com>
References: <20190419131221.28297-1-po-hsu.lin@canonical.com>
Message-ID: <03bdc88d-07cd-08ca-7d2f-ba93069eb41b@kernel.org>

On 4/19/19 7:12 AM, Po-Hsu Lin wrote:
> Test files created by test_create*() tests will stay in the
> $efivarfs_mount directory unless the system was rebooted.
> 
> When the tester tries to run this efivarfs test again on the same
> system, the immutable characteristics in that directory will cause some
> "Operation not permitted" noises and a false-positve test result to the
> test_create_read() test.
> 
>      --------------------
>      running test_create
>      --------------------
>      ./efivarfs.sh: line 59: /sys/firmware/efi/efivars/test_create-210be57c-9849-4fc7-a635-e6382d1aec27: Operation not permitted
>        [PASS]
>      --------------------
>      running test_create_empty
>      --------------------
>      ./efivarfs.sh: line 78: /sys/firmware/efi/efivars/test_create_empty-210be57c-9849-4fc7-a635-e6382d1aec27: Operation not permitted
>       [PASS]
>      --------------------
>      running test_create_read
>      --------------------
>      open(O_WRONLY): Operation not permitted
>       [FAIL]
>      --------------------
> 
> Create a file_cleanup() to remove those test files in the end of each
> test to solve this issue.
> 
> Also, use this function to replace the existing file removal code.
> 
> Link: https://bugs.launchpad.net/bugs/1809704
> 
> Signed-off-by: Po-Hsu Lin <po-hsu.lin at canonical.com>
> ---

Thanks for the patch. There is another patch that does the same in
linux-kselftest next branch.

Please check to see if that fixes the problem you are seeing.

thanks,
-- Shuah
