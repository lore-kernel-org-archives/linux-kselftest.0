From: pvorel@suse.cz (Petr Vorel)
Date: Mon, 11 Mar 2019 22:39:29 +0100
Subject: [PATCH v3 2/7] selftests/ima: define a set of common functions
In-Reply-To: <1552304473-3966-3-git-send-email-zohar@linux.ibm.com>
References: <1552304473-3966-1-git-send-email-zohar@linux.ibm.com>
 <1552304473-3966-3-git-send-email-zohar@linux.ibm.com>
Message-ID: <20190311213929.GA13024@x230>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190311213929.rDwuqZUteftltORtyNwTphVHLygVQQpSDuTKJeTIojE@z>

Hi Mimi,

> Define, update and move get_secureboot_mode() to a common file for use
> by other tests.

> Updated to check both the efivar SecureBoot-$(UUID) and
> SetupMode-$(UUID), based on Dave Young's review.

> Signed-off-by: Mimi Zohar <zohar at linux.ibm.com>
> Reviewed-by: Petr Vorel <pvorel at suse.cz>
> Cc: Dave Young <dyoung at redhat.com>

Minor comment below.

...
> +++ b/tools/testing/selftests/ima/ima_common_lib.sh
> @@ -0,0 +1,36 @@
> +#!/bin/sh
> +# SPDX-License-Identifier: GPL-2.0
> +
> +# Check efivar SecureBoot-$(the UUID) and SetupMode-$(the UUID).
> +# The secure boot mode can be accessed either as the last integer
> +# of "od -An -t u1 /sys/firmware/efi/efivars/SecureBoot-*" or from
> +# "od -An -t u1 /sys/firmware/efi/vars/SecureBoot-*/data".  The efi
> +# SetupMode can be similarly accessed.
> +# Return 1 for SecureBoot mode enabled and SetupMode mode disabled.
> +get_secureboot_mode()
> +{
> +	local efivarfs="/sys/firmware/efi/efivars"
> +	local secure_boot_file=$efivarfs/../vars/SecureBoot-*/data
> +	local setup_mode_file=$efivarfs/../vars/SetupMode-*/data
Sorry for nitpicking, but also quote variables these two variables
containing string:
	local secure_boot_file="$efivarfs/../vars/SecureBoot-*/data"
	local setup_mode_file="$efivarfs/../vars/SetupMode-*/data"

> +	local secureboot_mode=0
> +	local setup_mode=0
> +
> +	# Make sure that efivars is mounted in the normal location
> +	if ! grep -q "^\S\+ $efivarfs efivarfs" /proc/mounts; then
> +		log_skip "efivars is not mounted on $efivarfs"
> +	fi
> +
> +	if [ ! -e $secure_boot_file ] || [ ! -e $setup_mode_file ]; then
I prefer to quote every variable in [ ] (at least for -f -e -z -n,
to prevent shell behavior on empty (I know it's not necessary here):

f=; [ -e $f ]; echo $?
0
vs.
f=; [ -e "$f" ]; echo $?
1


Kind regards,
Petr
