From: shuah at kernel.org (shuah)
Date: Mon, 25 Mar 2019 08:34:54 -0600
Subject: [PATCH] selftests: efivarfs: remove the test_create_read file if
 it was exist
In-Reply-To: <1552965871-77209-1-git-send-email-zhangxiaoxu5@huawei.com>
References: <1552965871-77209-1-git-send-email-zhangxiaoxu5@huawei.com>
Message-ID: <2b22da59-bb01-998c-6318-0f76df607680@kernel.org>

On 3/18/19 9:24 PM, ZhangXiaoxu wrote:
> After the first run, the test case 'test_create_read' will always
> fail because the file is exist and file's attr is 'S_IMMUTABLE',
> open with 'O_RDWR' will always return -EPERM.
> 
> Signed-off-by: ZhangXiaoxu <zhangxiaoxu5 at huawei.com>
> ---
>   tools/testing/selftests/efivarfs/efivarfs.sh | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/tools/testing/selftests/efivarfs/efivarfs.sh b/tools/testing/selftests/efivarfs/efivarfs.sh
> index a47029a..d386610 100755
> --- a/tools/testing/selftests/efivarfs/efivarfs.sh
> +++ b/tools/testing/selftests/efivarfs/efivarfs.sh
> @@ -77,6 +77,10 @@ test_create_empty()
>   test_create_read()
>   {
>   	local file=$efivarfs_mount/$FUNCNAME-$test_guid
> +	if [ -f $file]; then
> +		chattr -i $file
> +		rm -rf $file
> +	fi
>   	./create-read $file
>   }
>   
> 

Thanks for the patch. I will apply it for the next rc

thanks,
-- Shuah
