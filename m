Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 740F73B3C0E
	for <linux-kselftest@vger.kernel.org>; Fri, 10 Jul 2026 10:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783678571; cv=none; b=cFhbCI/fXgqUYU93dMV1EnqvYNl7G/EV+5XOna9YrPimT4qoJuHWM4c8K0NMmbwgnLAFPYWv4LoDg9ETFz/N1PT2exi/mkNqEI4rJyTwLphdawvjH5c/ebdneP5gbDGNzVNcs6v9jBbzgi2ETStE/HY4dPpxob7yDzmKYcPaYCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783678571; c=relaxed/simple;
	bh=NdS1SoYEHzFcC71PEE1dQpzia22T95oYq/JfF/B5Jo8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ruh8lWoIWqK+4/OJzmdIJEK+BJ7TJ92qy+pvI+EVTcjkXzIlz8DS8/3iykEQ3S7yltDXp9wP4WT11/GrXaqoLJq2D7PK8JKaqwtp/SpKp5Scj9SMYeiwPK8JQTeOIbxanmSXbIfcvPcVnsbzoO5yZcjj6AIM75dquKJvBYJLYt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dhOkQcHx; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dhOkQcHx"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-493f4638f4aso4645435e9.3
        for <linux-kselftest@vger.kernel.org>; Fri, 10 Jul 2026 03:16:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783678567; x=1784283367; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1vIQWYleDgGJPSPgzFWyTV1QrDZqaDu8yW8UkA/woeQ=;
        b=dhOkQcHxGZ396MMQ6oIxz5zx5VpvJZq8z7uXZ0wUCryi/zbcE5Nbjj4QAjfc4Z4X8y
         0ZKe+jD31FupS2G4vivief94gg+b4luJVhbTSVMU7yeZ1KeRSMAxoKFkR1GasQ22lhxw
         xHAmJ5lgrvWCfmkzF8x5Vj7HfItm45GR6G3QXFtlK4nkHIzlX7p6z19W+CM+hsfn/hRJ
         4Mq9pnHBuP7FHhm2hOcpcsg2v8X4wIPpzE3BriwmDeIZ0ADWrxUYI68pQ7CuYVhhhGeg
         5qg+1fgkx5CdQRRLzYVpGwm4KDqkmYpLOEu43eyQZ4IfIZdho85wj5SUI4Rd8JVfki7w
         1N4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783678567; x=1784283367;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1vIQWYleDgGJPSPgzFWyTV1QrDZqaDu8yW8UkA/woeQ=;
        b=sqK2hpM6xcO3jHZ+2Dl3oYV6HYrNBRwWMTdJxTlxZ+v7wb885YG1J53g9g3mjptBMV
         djxUQvVI7BD2WwLJlVyF8gHjseG/iDeuhXMLgyvUI+0s4jynOrrYJ/w7tAJYr+HZIR30
         fhBx+8ezS5HAb0HR4iNcAZVAj/hTbvEhBFj1dTNEYDUZYBET/riYVAkhyjvgyYC4dyu+
         S8cWYbkYJXKJ7hz7bJLHMOwta29nWW1F0JFLTGWVz53+CNIUHTIlsTuj8rvMdDeJUB4o
         FyfURLQBk1hHtn5gCBe/TiYg1rMQLfJJ0Wu3cv6sB4+leuxnoBpPsYgjwnz2QWDcv67K
         r2Rg==
X-Forwarded-Encrypted: i=1; AHgh+Rrc+awaPCSpvxmdMfsBHHMSfx/93/H7NBJR53KAnuV088flt+himPCx+RAEFX/I1l8gBSsk3REm332/cpAwCx4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxSoSrbPHb+5Cej2XWAA7woY3aVCqpWD912bBCp1kl025i+YfJ2
	eqDM1tlXrF6DeQrUu3GxmCuKXvRauaXkTxjMoXSrx834k4D0OPLyFfL4
X-Gm-Gg: AfdE7ckivmymh0GdiFdzPROB/KAfcpj4ir+04tQZq3L2gSIVVvA1Rr8jQ0NirqmJ6zL
	YT4tL88aJHCWM5apfKgjltgg6soYFGGl37W9VxSWQOqy3fKMCOqeg+Ggr9/qcRCvaRnXXdEKW2W
	9J9Zu4KlYITIQSshupi0Ml5Mnqn5eo4a6IzdqjsnigQvOr5ggGlnhM6Zy1XFavKK8mpmMfoAbnV
	bDP4zLGsRe5AK70Qw5zRR7kGVp92WYou2+aLZknZpF0IYe6JRBhnRGO67W2MPPcBhRAyMAuY8pH
	8xKo2v51suQi6XH4U5nUsbTkkX29gQ2gbdfhSPdRUDPAhzHvNWH6UsPOi8Yoh6Hz6dcAaH9Zdf3
	knEbmKyGKIWAeG6CtOG/F0aeNydKAqcZfd7+qEuTeyc6xY5slXNrHRq4NuweRaqiQvyxDiK9i57
	s8pd8+/w==
X-Received: by 2002:a05:600c:828c:b0:493:bed9:b53d with SMTP id 5b1f17b1804b1-493e68ee07cmr95829375e9.31.1783678567070;
        Fri, 10 Jul 2026 03:16:07 -0700 (PDT)
Received: from curiosity ([80.211.22.60])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493f49755f9sm34621525e9.8.2026.07.10.03.16.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 03:16:06 -0700 (PDT)
Date: Fri, 10 Jul 2026 13:16:02 +0300
From: Sergey Matyukevich <geomatsi@gmail.com>
To: Wang Yan <wangyan01@kylinos.cn>
Cc: shuah@kernel.org, pjw@kernel.org, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, alex@ghiti.fr, andybnac@gmail.com,
	andrew.jones@oss.qualcomm.com, thecharlesjenkins@gmail.com,
	linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] selftests/riscv: ptrace: Fix memory leak of regset_data
 in vector tests
Message-ID: <alDGYu3qkX2B6J2_@curiosity>
References: <20260710083437.489648-1-wangyan01@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260710083437.489648-1-wangyan01@kylinos.cn>

> The regset_data buffer allocated with calloc() in the parent process
> of several vector ptrace tests is never freed before returning,
> causing memory leaks in:
> 
> - ptrace_v_not_enabled
> - ptrace_v_early_debug
> - ptrace_v_syscall_clobbering
> - v_csr_invalid/ptrace_v_invalid_values
> - v_csr_valid/ptrace_v_valid_values
> 
> Add free(regset_data) before kill(pid, SIGKILL) to release the
> allocated buffer.
> 
> Signed-off-by: Wang Yan <wangyan01@kylinos.cn>
> ---
>  .../testing/selftests/riscv/vector/validate_v_ptrace.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/tools/testing/selftests/riscv/vector/validate_v_ptrace.c b/tools/testing/selftests/riscv/vector/validate_v_ptrace.c
> index b038e2175c80..a388b7963d47 100644
> --- a/tools/testing/selftests/riscv/vector/validate_v_ptrace.c
> +++ b/tools/testing/selftests/riscv/vector/validate_v_ptrace.c
> @@ -75,7 +75,7 @@ TEST(ptrace_v_not_enabled)
>  		ASSERT_EQ(-1, ret);
>  
>  		/* cleanup */
> -
> +		free(regset_data);
>  		ASSERT_EQ(0, kill(pid, SIGKILL));
>  	}
>  }
> @@ -207,7 +207,7 @@ TEST(ptrace_v_early_debug)
>  		EXPECT_EQ(vl_csr, regset_data->vl);
>  
>  		/* cleanup */
> -
> +		free(regset_data);
>  		ASSERT_EQ(0, kill(pid, SIGKILL));
>  	}
>  }
> @@ -331,7 +331,7 @@ TEST(ptrace_v_syscall_clobbering)
>  		EXPECT_EQ(0UL, regset_data->vl);
>  
>  		/* cleanup */
> -
> +		free(regset_data);
>  		ASSERT_EQ(0, kill(pid, SIGKILL));
>  	}
>  }
> @@ -649,7 +649,7 @@ TEST_F(v_csr_invalid, ptrace_v_invalid_values)
>  		ASSERT_EQ(ret, -1);
>  
>  		/* cleanup */
> -
> +		free(regset_data);
>  		ASSERT_EQ(0, kill(pid, SIGKILL));
>  	}
>  }
> @@ -911,7 +911,7 @@ TEST_F(v_csr_valid, ptrace_v_valid_values)
>  		EXPECT_EQ(regset_data->vlenb, vlenb);
>  
>  		/* cleanup */
> -
> +		free(regset_data);
>  		ASSERT_EQ(0, kill(pid, SIGKILL));
>  	}
>  }

Thanks !

Reviewed-by: Sergey Matyukevich <geomatsi@gmai.com>

Regards,
Sergey

