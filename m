From: pvorel@suse.cz (Petr Vorel)
Date: Thu, 28 Feb 2019 22:01:54 +0100
Subject: [PATCH v2 3/5] selftests/ima: define common logging functions
In-Reply-To: <1551223620-11586-4-git-send-email-zohar@linux.ibm.com>
References: <1551223620-11586-1-git-send-email-zohar@linux.ibm.com>
 <1551223620-11586-4-git-send-email-zohar@linux.ibm.com>
Message-ID: <20190228210154.GA28402@dell5510>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190228210154.GV8T4L2RAmyr5ordKJ-R0np1w9PLkzBiomNmHTjple4@z>

Hi Mimi,

> Define log_info, log_pass, log_fail, and log_skip functions.

> Suggested-by: Petr Vorel <pvorel at suse.cz>
> Signed-off-by: Mimi Zohar <zohar at linux.ibm.com>
Reviewed-by: Petr Vorel <pvorel at suse.cz>
> ---
>  tools/testing/selftests/ima/common_lib.sh      | 43 +++++++++++++++++++++++---
>  tools/testing/selftests/ima/test_kexec_load.sh | 19 +++---------
>  2 files changed, 43 insertions(+), 19 deletions(-)

...
> diff --git a/tools/testing/selftests/ima/common_lib.sh b/tools/testing/selftests/ima/common_lib.sh
> index 5583ea74c14e..c6d04006281d 100755
> --- a/tools/testing/selftests/ima/common_lib.sh
...
>  	# Get secureboot mode
>  	local file="$efivarfs/../vars/SecureBoot-*/data"
>  	if [ ! -e $file ]; then
> -		echo "$TEST: unknown secureboot mode" >&2
> -		exit $ksft_skip
> +		log_skip "unknown secureboot mode"
>  	fi
> -	return `od -An -t u1 /sys/firmware/efi/vars/SecureBoot-*/data`
> +	ret=`od -An -t u1 /sys/firmware/efi/vars/SecureBoot-*/data`
Missing local. Usually it's good to put all locals at the top.

> +	[ $ret -eq 1 ] && log_info "secure boot mode enabled"
> +
> +	return $ret
>  }
...

Kind regards,
Petr
