Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 719FF3B71AE
	for <linux-kselftest@vger.kernel.org>; Fri,  5 Jun 2026 14:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780670219; cv=none; b=Xm6yz4IVWJoSKX66JhownDNQ+QPyHpmd6QRsAFT9aV6P/GP2T3PFV8m8Gft1+lwo3drGpp5nDhLx/d0dG5I7EQwKNSJJJ7a2ylK64vmljqehGlJoadDrM/BLppDcy26x16bZe8hOgmeoDZd7glsYxNO3ZeiWaV0qyJEBxA71pKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780670219; c=relaxed/simple;
	bh=2/okv5R7nw3nettmT+HkbGVvZOenFtZVq77Gbvi5thY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DQMg1sXZh7ierHdFIohrmK7FZpCdXwUTYeKrU1upsOOaKTr3RSpYK/b5uzownVan2kUSVhdZ4iD5GiI2cncZIEDuwV2BKgFVPYaX6cdsF2bZRcqOpB3fFbTMHseQCqc8/OT0hWKIDmYUpiOmEAA8dU0Nkin6/ygTqkPjtvz1bvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=L+Dxbpx1; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="L+Dxbpx1"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4906869f0cbso23713745e9.1
        for <linux-kselftest@vger.kernel.org>; Fri, 05 Jun 2026 07:36:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1780670210; x=1781275010; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jKrctiRdzG2v5+tRw+/itTjUFXwqDjxnSAqBHxkkoBk=;
        b=L+Dxbpx1C/7UkK5fDhN+5jQ4QNrxDKtZNbnbb+Ne2H//MvibxOqOs56WXzy180OLic
         gTg1pB0lA7qYohmjGREO1lU2RLV30jbmKTe8wMhs3bZMDjI7uVgnN+CF6oSnQNCcKkrC
         4NWNRhIcEYigromtdSXJ3gHuzghwJ3aGRWWtqdMbSFSx8BbboeybQmm/c0c1RL7UhWLI
         tt3p5yQ7h/yqAy2Qcr94Taj1zvhBQ+DmRdhK6h6gskBe5VFzUITcgwWfQsEeSsu5o4Om
         g1ocRMkAonnnZjIKZHs/ZTBLmM2GtSIqfOZEI/zZ1oqXbxaNAcHXZsM1uhz7Rkuaru+3
         3ahw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780670210; x=1781275010;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jKrctiRdzG2v5+tRw+/itTjUFXwqDjxnSAqBHxkkoBk=;
        b=B02bDiRPevzv4FLCi2X3sRJbyKLEDbs+/NKw1Jwx9+X5djIbtZb9YaokxobcTTD6m4
         KcUk6/XOxnLa8GRXG0O+1vOFt6fKtXzWZs7CD5klludXbW23wNqqbLUQ3NOtPSaNHYLO
         skeyU46pnIqs/Hyg0cw0sEg8qhVU1GLXdiDorRl/3Koasv9003P0GDnleFDYZt8ncUaN
         pa8y2Ep6rvM1NpRS34mJ2dU6jzhkYOSFCpFYSs2MlLXYsCiOF5Er1BjM7WgC9byDc3Ox
         LMwtZegDD0XLfaxGT+xGxeJfAdm8vLLoRBeHEG8G4UMu1FNHFrMFhtD6JiEHh077TWTY
         nrfg==
X-Forwarded-Encrypted: i=1; AFNElJ9cESvFkPuzdkiLmhqXtzY3392HSXHKsN3TFvxB2GX/FGthlPx154GYCzcCHvohmub7OXrSVd92NivejXM5H/8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwuNN2rlNFWeX4iXYwkRpjpu+aCvHPrR0U4fJm2DhcMr5G4YnTz
	yp+Jqxuptd9Am8mwOruL+fTq49Gn0uIx58jV/Sgly6DoffsmJ8C4KzxFsqYWquOkVxY=
X-Gm-Gg: Acq92OEk4XuWYSvrhbNtny7TovgOhvGpoEQpA+iqxD+5bktuQYrKdOxKvEkhKUheZJK
	5P45L6qhYof+Qsq9AJSlmdZfhzW5dd3lH1tPO8n9p6bqVrxZHKZlsXuDY80JIOqkk8zDm/SbwJV
	fpUaH+ItCBR+thsAERsXgX79x05yMP687l2YZbz98e7LHEDGE2kq+z05abwMJykaIwAG6MwuEoR
	NTdq2vsccYea9aUQcxSgSaWdpeGQPh+4/TiyFD0Dmce4AEctGFABAyz/vy/pIZKJ/Ng4h6K/1HK
	12o64IE+enT5E+xGGZ0Uo4onrKCpx8B0R4/RUUpHh3oCFernRsu8lHTEk/gkSiqt89i4x9O+7Qc
	I0z3fa9cnQLBIq1lM4BIAixlIDEQgmG66WPxsc3USxcmvLkc3H+9+nHyIJp9M84I7gEE/iSHBWW
	Lyu5qi63paRfe9IZUmx2HJTpCwY9wSowSiTN/dIYb0T2fZ3t0=
X-Received: by 2002:a05:600c:524f:b0:48a:9428:5522 with SMTP id 5b1f17b1804b1-490c2622ad9mr69963445e9.16.1780670209676;
        Fri, 05 Jun 2026 07:36:49 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3fcf5bsm184239235e9.9.2026.06.05.07.36.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 07:36:49 -0700 (PDT)
Date: Fri, 5 Jun 2026 16:36:47 +0200
From: Petr Mladek <pmladek@suse.com>
To: Marcos Paulo de Souza <mpdesouza@suse.com>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>, Jiri Kosina <jikos@kernel.org>,
	Miroslav Benes <mbenes@suse.cz>,
	Joe Lawrence <joe.lawrence@redhat.com>,
	Shuah Khan <shuah@kernel.org>, live-patching@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	marcos@mpdesouza.com
Subject: Re: [PATCH 3/4] selftests: livepatch: Adapt mod_target module to
 pass on 4.12 kernels
Message-ID: <aiLe_3T3rHd2-Ryb@pathway.suse.cz>
References: <20260524-livepatch-unload-on-fail-v1-0-7465de7f741d@suse.com>
 <20260524-livepatch-unload-on-fail-v1-3-7465de7f741d@suse.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260524-livepatch-unload-on-fail-v1-3-7465de7f741d@suse.com>

On Sun 2026-05-24 20:50:32, Marcos Paulo de Souza wrote:
> Use the stable module_param_cb API instead of proc_fs for exposing module
> state. This approach is compatible with kernel 4.12 and later. The end
> result is the same: the module has a function that shows a string, which
> is later livepatched to show a different string. The only difference is
> that the file being checked is now a module parameter instead of a
> procfs entry.
> 
> --- a/tools/testing/selftests/livepatch/test-livepatch.sh
> +++ b/tools/testing/selftests/livepatch/test-livepatch.sh
> @@ -198,26 +198,25 @@ livepatch: '$MOD_REPLACE': unpatching complete
>  % rmmod $MOD_REPLACE"
>  
>  
> -# - load a target module that provides /proc/test_klp_mod_target with
> -#   original output
> -# - load a livepatch that patches the target module's show function
> -# - verify the proc entry returns livepatched output
> +# - load a target module with module_param_cb get data with original output
> +# - load a livepatch that patches the target module's get function
> +# - verify the parameter get function returns the livepatched output
>  # - disable and unload the livepatch
> -# - verify the proc entry returns original output again
> +# - verify the parameter get function returns the original output again
>  # - unload the target module
>  
>  start_test "module function patching"
>  
>  load_mod $MOD_TARGET
>  
> -if [[ "$(cat /proc/$MOD_TARGET)" != "$MOD_TARGET: original output" ]] ; then
> +if [[ "$(cat $SYSFS_MODULE_DIR/$MOD_TARGET/parameters/klp_mod_arg)" != "$MOD_TARGET: original output" ]] ; then

I would personally call the parameter "test" or something simple.

A better descriptive name was needed in the top-level /proc directory
to prevent conflicts. But the module-specific parameter is
checked module-specific directory...

>  	echo -e "FAIL\n\n"
>  	die "livepatch kselftest(s) failed"
>  fi
>  
> --- a/tools/testing/selftests/livepatch/test_modules/test_klp_mod_patch.c
> +++ b/tools/testing/selftests/livepatch/test_modules/test_klp_mod_patch.c
> @@ -8,17 +8,16 @@
>  #include <linux/livepatch.h>
>  #include <linux/seq_file.h>
>  
> -static int livepatch_mod_target_show(struct seq_file *m, void *v)
> +static int livepatch_mod_target_get(char *buffer, const struct kernel_param *kp)
>  {
> -	seq_printf(m, "%s: %s\n", THIS_MODULE->name,
> -		   "this has been live patched");
> -	return 0;
> +	return sprintf(buffer, "%s: %s\n", THIS_MODULE->name,
> +		       "this has been live patched");

Please, use sysfs_emit() instead of sprintf(). It is a specifically
designed API for sysfs output. It prevents a potential buffer overflow.

It is less important here. But we should show good examples...

>  }
>  
>  static struct klp_func funcs[] = {
>  	{
> -		.old_name = "test_klp_mod_target_show",
> -		.new_func = livepatch_mod_target_show,
> +		.old_name = "test_klp_mod_target_get",
> +		.new_func = livepatch_mod_target_get,
>  	},
>  	{},
>  };

Otherwise the change looks good to me.

Best Regards,
Petr
