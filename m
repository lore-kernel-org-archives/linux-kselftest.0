Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795008162;
	b=vd4YTEsRmlmW4MdeAoUmrxiBrO1+k1B0Hb7Zf4Pv43GVa36/4Uns7GnhY+tdIgo2MgGa
	 jPnGzoup7sxU3TTlQxIw+5ZqJcJrG+Mmz+7RsKWh53ix1+djYwrGxg8gxcFEXGtAddZMM
	 34KdyRJiF/3eRvzikquQBlJLKEPMh+EcdY0VekgroXRtre2Au7b/H3OnkxPpHZin22uC6
	 0bEepY+QFSD6M7ftMipl4AJ5tA/ajY4rtyd3bhBiIGwwLcCVNlnnfH1umADMObxFcKxo7
	 dEbP5hyzJoGiBLEFa/t4dPnV/EFefCGKLvSTiTkyOol2K9qEC3zRcHG0mvd6z3a1YsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795008162;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=+wKWXTICw+rK5bkgX4OO79DEF0MgQ4W42M/9WAyxMKM=;
	b=TOOCIWnrSEiRE6FoynIG21/5OsxIXtDDqNdevlGU+tGlcpWcYnCBx5ibssyXxjh7UcRi
	 Af255Tyb7nL0q4JQN+7tLpmT0LgboKZdtTewT31N6+d8Vc+kwehbUj7NFF6f1ePLfsYso
	 fw85IuKahBMyLIQas4NOylfmd2xvtQxu+pkHzOezI+9Qkj23IHLlRwrboCxVmI+ul6Bl3
	 2EQSOxH1k9HNFMk25zV7oLf3znvwsm5VkirOn31fx79Buj4vEXfS7fkBCn7Mk4j6s+hsg
	 KIBa3RKacP3cMVyGnHOAMmFWpNMMj1glZU3CJXq7ImM2DpyaItobGjMizgMwjZwsrHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dlNbPrgu;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 669B1606A32F
	for <linux-kselftest@vger.kernel.org>; Wed, 18 Nov 2026 13:22:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 669B1606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dlNbPrgu
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4bb55cda775so5304825e9.0
        for <linux-kselftest@vger.kernel.org>; Wed, 18 Nov 2026 05:22:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795008161; x=1795612961; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+wKWXTICw+rK5bkgX4OO79DEF0MgQ4W42M/9WAyxMKM=;
        b=dlNbPrguCgVqYXFYDz1P6ETpZkY6b9CW2PmSUSxzaGTGqkWyeZnAhpgdAXWcl2sxf5
         tOkKYgfxCO+6SDl0hNOh4dva/qaMAzN5dqNkCW70X0bIDZnqYLrKwX3dVl4GtFu1wStw
         Ftq08ZhaTalQh/h0Bkinb6AzR8B4ZT3jRBimwEfqbnfTup+7aBmeT68v4h0oPH4Tqqoy
         xkYMF4H1iu2IDvWdkKFVAGo1vSMgceMe+q9dksArDf4D9+T+RlggZ1nT6jmeqIv9T3+X
         rYyjoj2ZsUtnlxmT91G9K+1jdE1J2mdbb1TpzVS+rjdiy24+8Vot2UO11Wyntan5kv7n
         4FMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795008161; x=1795612961;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+wKWXTICw+rK5bkgX4OO79DEF0MgQ4W42M/9WAyxMKM=;
        b=o8lBNAxCRJscXCSZCvaiK+IOj2tvThEZKLD75QLXRnblNpJZ+vDRw1dtibEktu0g3y
         pGqPIEKntogloQIiv8qvyZET+vN/3HN41CLj3LjOFMdhxG7qf+CGs7H+YxGDaByzkrHh
         7IFoa15JsXCS8O7eXHtcVlZHN9+s4zIWKGH1oI7PeWfd97rqsowDaqiZsuIA5nIbG5fD
         z7wSzhoUTLUtu4aF3ylyLZGBPtals+nR8w3e3BxlduTxq+w3Oc5U8mMhr0E09CYYQHUm
         lypJruQRautSUANxpvs5rvVumwIUG+ZERPO5y8a1MshpOM8P2UGsz4Xn68zmGNPUX5+M
         LykA==
X-Forwarded-Encrypted: i=1; AL+hErGfGtggdf67VvHeDEb4K+uZbOr61JgLA+XersSJVcvb3g5QufMiAy8Rohrm5zLRTcL/GUZGWepis/S8GRT/Htg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+adS7v3bNSfHOHtregynejU4TCEMZHPHNBGzwJNsaDrx1aW5eB
	JcoQmT5MMbx1vuJkfdBJWaCPQaC9FjiE2iI5IsUQRGO6wbUUVsGH+mK0
X-Gm-Gg: AYBFou3YEUIysO5nu603Vj1aHA0Sls3Khq470VRCxjCz5nSlVcqrZijQyupgD+nTUSY
	3v8rF/lq9YRpSH79O5KjcJPvxeDp6OWHM5bojCDd+9zaxvgdk4v07pNmZIOgxQYHm081c5oSNHN
	IjJAImSUOmyS/3r2YIiwToFB3cn9NBjluPRW+oJ0mUP2TpOWbm3ByJuB3YIH78kVWlqRO8oxHjH
	b0Fo/3xolA2SJHkeGlk31+cHXMdrQ3qc+emeQuRM7cGzDwrb4BTgH9/pFyDM8G7ffqfKOowDiSy
	aBP6xo+iECsI1MRI0dHXYt9c+b2EmI2TLJdOP6FlGPda8VHQkthKyZzABDu1suwUgD9Z888u/jG
	uHWCd/50Zg7022Km4deaHC5GOrIqzTFJGwD+0oL4f3F588zURAPAhZlAUb4neX2mmp+Px3QNB5O
	ScffmjCZfjqCnbGvWCQWlZwEMrZdeRusCGaSh23IUiqOJSoFvGSb0jZJZ7kPUbzxu6m/ZyYWSk7
	PCxdHCLK3cVk4PGJ0O+gijX+XeS9LInlKZjJdSxGS+1uKi2F9BQmgKDdinvEOKG6EK8cRDmUV3C
	//sSkDFU8SHew6uvpSCrLHoFeg5ha3DK/+uGciVOnOepGp/wNeu889DGMCE5B5e5jeE=
X-Received: by 2002:a05:600c:6290:b0:4bb:6a78:7c42 with SMTP id 5b1f17b1804b1-4bb7d6cd48cmr51017095e9.1.1795008160593;
        Wed, 18 Nov 2026 05:22:40 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7d2cfce7sm67254185e9.14.2026.11.18.05.22.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 05:22:40 -0800 (PST)
Date: Wed, 18 Nov 2026 13:22:39 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Sasha Levin <sashal@kernel.org>
Cc: Christian Brauner <brauner@kernel.org>, Shuah Khan <shuah@kernel.org>,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH] selftests/pidfd: print time_t as long long
Message-ID: <20261118132239.600873a8@pumpkin>
In-Reply-To: <20261103155447.534264-1-sashal@kernel.org>
References: <20261103155447.534264-1-sashal@kernel.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue,  3 Nov 2026 10:54:47 -0500
Sasha Levin <sashal@kernel.org> wrote:

> On 32-bit architectures with a 64-bit time_t, such as armhf in Debian
> 13, printing the time_t values with %lu warns:
> 
>   pidfd_test.c:523:50: warning: format '%lu' expects argument of type 'long unsigned int', but argument 2 has type 'time_t' {aka 'long long int'} [-Wformat=]
> 
> Cast them to long long and print them with %lld.
> 
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> ---
> Found with a 32-bit build of the selftests with a 64-bit time_t (gcc 16
> and clang 21 with -m32 -D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64);
> KernelCI's 32-bit arm builds show the same warnings. The changed files
> build without format warnings there now, and the x86_64 builds don't
> change. The other selftests get the same kind of fix in separate
> patches.
> 
>  tools/testing/selftests/pidfd/pidfd_test.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/testing/selftests/pidfd/pidfd_test.c b/tools/testing/selftests/pidfd/pidfd_test.c
> index 932cbd8caa770..a53e72cb256ce 100644
> --- a/tools/testing/selftests/pidfd/pidfd_test.c
> +++ b/tools/testing/selftests/pidfd/pidfd_test.c
> @@ -520,7 +520,7 @@ static void test_pidfd_poll_exec(int use_waitpid)
>  
>  	time_t prog_time = time(NULL) - prog_start;

Why not just change the type to 'unsigned int' and use "%u" ?
It isn't as though the difference is going to be longer than 75 years.

David

>  
> -	ksft_print_msg("Time waited for child: %lu\n", prog_time);
> +	ksft_print_msg("Time waited for child: %lld\n", (long long)prog_time);
>  
>  	close(pidfd);
>  
> @@ -599,7 +599,8 @@ static void test_pidfd_poll_leader_exit(int use_waitpid)
>  
>  	time_t since_child_exit = time(NULL) - *child_exit_secs;
>  
> -	ksft_print_msg("Time since child exit: %lu\n", since_child_exit);
> +	ksft_print_msg("Time since child exit: %lld\n",
> +		       (long long)since_child_exit);
>  
>  	close(pidfd);
>  

