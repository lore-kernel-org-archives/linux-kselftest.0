Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4AAF346AF8
	for <linux-kselftest@vger.kernel.org>; Wed, 27 May 2026 12:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779883793; cv=none; b=hr8yJaPA6VBE8jYZird+D917yLTdDeRrbASrG8WE1+UskrppsJYqnq2bSLcqGMM+Wx0ghKeIWLyQ/3BRVANrcPuRRw6oKandE1UBbEq3ghmVUnf/dl7DsemhTO4qCbesDK2qazNTDLwRUwe31wS6zcJ/yyKnDDUt8lAjLaTX/6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779883793; c=relaxed/simple;
	bh=drfjH7o548i+540WGAubuCmL5rG/O56cLDfTL1pqmIM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=hKUeKs8W5qy+1KF/wK/+Wd4wd5t+VLu9ch9Dc+W3G/hOPuARElH2YhGEzYnPvdpJGk219RaRi6ue5dzWwCOKBhI1ci+GRmeOX4hz4Fu8sXUAyG8rYVL8Oc1UbKfladOsAfZz3+yqt/ypWus7Fc3lj1mP7A9U7vWml0jDfnhwfZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=aDP7eDGA; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="aDP7eDGA"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4891c0620bcso74159495e9.1
        for <linux-kselftest@vger.kernel.org>; Wed, 27 May 2026 05:09:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1779883790; x=1780488590; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gNImo5uz/kWBnbovfRMfhXVPnRP4ApbZCS3Az/Sla4I=;
        b=aDP7eDGA+o7dGtU/FNlK0VMk+iSUkrxI81hLrVuPi2TSoGRoX8YucH8wIN/+N1I2D2
         zmk/iqwm2DEHTx5639SoJNIUQd4rI7x0NpqJp8YFJDlXK7MK3Gx2FtZPHmBqKoA9esby
         3IqXZgt66CR8Eg+e+tU+VBtKEechmq4cc092NB7+ZkP58cKgvQq1YrPR/kAhNIc5prLc
         NBGo/PBMKuLNUpLyFNYS7n58nOw7n3nviDjXl4ZvywjUEAhXagd0Gg5/BB9N2B9o2eSQ
         fUTt4d5nQ1rwb+mZiQfzukLjsmv5TJ3k2bdTQE7Zr6feFQRxJWMIsRKbJgQup6pqye2E
         9q7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779883790; x=1780488590;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gNImo5uz/kWBnbovfRMfhXVPnRP4ApbZCS3Az/Sla4I=;
        b=USttwIhTUJ8kv768Yc+nNsy2eL3cXnInJYnf4YUtUUBJjT5vMHGmPIg24lPM8cD/wg
         dWbngpovMoDIkLTR7khz3NA8De3TAKTWnDwpdpDS9edqY3GlSmJusu7EwtSMuAVN8Qex
         g+dJbpevsWxjxfOBOsM5l+aqyKD+H9FDipGrbgAFgUCiOfgKzRyijFrv9ZoG++FnKaMx
         ecc+iSv/9wLnlMq3jW2MzXfP5oyBaKcaVpQCCknkpCLKZ/+xYORW+8F16kBQOgWvhvPu
         afwSaqETJRnhvBVDh6JBjqTb3CnlQOOhuu6tsGekRi8ZIcU5IzDE0x1BoYDPH2TpwFs5
         JfXg==
X-Forwarded-Encrypted: i=1; AFNElJ/E5VwY4CkivVxjS3noDittWVAVjbJLh3SG7154WvKDJ+HKAMHiVR167uxzG+0TSZReKIGS8aERYuE1PYqKNfM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzUQGrEGfejKeSE0FIxpFqOSJi7RVK+vrKGSQaNzrP6ybeBPvya
	4Z4NPvsYCQPDac3xg3mTxW4KQHswxRoWWHeMhTrA347McHKh084dYzGkyKRTSaW/Ssc=
X-Gm-Gg: Acq92OEYwWHulCjXpb2RnYzhsy0srZWyRtyhGcNqq+xv4UZHhVSoB3G35sDW6pLmFfR
	7Ab/GUnImncW3z0koYMsXDXzSkxRfSWb9/LA1K9kbBQwPw1e1F32dvFUqPBZ4dMAiqOTE1mRpG8
	j68Z0VFB7VCfL7BDnOMRKIQbYnd3AB93wULWFCV2en1QhgPav3E3swemmyLy3b/mtwmY75hfO47
	ovccSIEnysHkLabRIqMh0sBTBSzmIk9hDk3F0yLxzMA1QUoh9SxXNMbSdsCljknDeB6LtE+o+CF
	LosnNye3M4VJs9j9xek7y0T6PWzd2DEqExGEFTL5cPThCvXXKhM/zWaoZO+sfPmmmZeW7Onecis
	gru6wAMGpZ4B8vMX+TJJEdk05lfSQAwI1Fqvel7GhPS+oBFH1vV77mQ7njIJcxec1sSm4XMwB5M
	MTIYEEdlGs7UTSN7pTPnD2Yio/c148h5HDdDzDt5+lGrWaRHcRnv1zAJeH+p2N3WREF0SjPweT5
	+5agWrMinIFwYsk
X-Received: by 2002:a05:600c:35d6:b0:490:4973:91a0 with SMTP id 5b1f17b1804b1-4904973932amr354441475e9.10.1779883789964;
        Wed, 27 May 2026 05:09:49 -0700 (PDT)
Received: from ?IPv6:2804:1bc4:224:7800:585c:db3a:fcb:e21f? ([2804:1bc4:224:7800:585c:db3a:fcb:e21f])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-586f791fa49sm20367234e0c.12.2026.05.27.05.09.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 05:09:49 -0700 (PDT)
Message-ID: <cd470b3b399aa01dfa54a758eca77e58c672d314.camel@suse.com>
Subject: Re: [PATCH] selftests: livepatch: set LC_ALL=C to fix
 locale-dependent test failure
From: Marcos Paulo de Souza <mpdesouza@suse.com>
To: Qiang Ma <maqianga@uniontech.com>, jpoimboe@kernel.org,
 jikos@kernel.org, 	mbenes@suse.cz, pmladek@suse.com,
 joe.lawrence@redhat.com, shuah@kernel.org
Cc: live-patching@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Wed, 27 May 2026 09:09:44 -0300
In-Reply-To: <20260527095929.1504032-1-maqianga@uniontech.com>
References: <20260527095929.1504032-1-maqianga@uniontech.com>
Autocrypt: addr=mpdesouza@suse.com; prefer-encrypt=mutual;
 keydata=mDMEZ/0YqhYJKwYBBAHaRw8BAQdA4JZz0FED+JD5eKlhkNyjDrp6lAGmgR3LPTduPYGPT
 Km0Kk1hcmNvcyBQYXVsbyBkZSBTb3V6YSA8bXBkZXNvdXphQHN1c2UuY29tPoiTBBMWCgA7FiEE2g
 gC66iLbhUsCBoBemssEuRpLLUFAmf9GKoCGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgk
 QemssEuRpLLWGxwD/S1I0bjp462FlKb81DikrOfWbeJ0FOJP44eRzmn20HmEBALBZIMrfIH2dJ5eM
 GO8seNG8sYiP6JfRjl7Hyqca6YsE
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.1 (by Flathub.org) 
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Wed, 2026-05-27 at 17:59 +0800, Qiang Ma wrote:
> When executing the command
> "make -C tools/testing/selftests TARGETS=3Dlivepatch run_tests",
> the following error message was reported.
>=20
> TEST: livepatch interaction with ftrace_enabled sysctl ... not ok
> ...
> livepatch: sysctlo
> : setting key "kernel.ftrace_enabled": Device or resource busy
> livepatch: sysctl: setting key "kernel.ftrace_enabled": =E8=AE=BE=E5=A4=
=87=E6=88=96=E8=B5=84=E6=BA=90=E5=BF=99
> ...
> ERROR: livepatch kselftest(s) failed
> not ok 5 selftests: livepatch: test-ftrace.sh # exit=3D1
>=20
> To fix it, set LC_ALL=3DC.

Would you mind adding more context here? Can you point exactly why is
this failing inside test-ftrace.sh script?

Have you double checked if you had any previous loaded livepatches why
trying to disable/enable livepatching?

I'll test in my environment, but I'm pretty sure that it used to work
not so long ago.

>=20
> Signed-off-by: Qiang Ma <maqianga@uniontech.com>
> ---
> =C2=A0tools/testing/selftests/livepatch/functions.sh | 2 ++
> =C2=A01 file changed, 2 insertions(+)
>=20
> diff --git a/tools/testing/selftests/livepatch/functions.sh
> b/tools/testing/selftests/livepatch/functions.sh
> index 8ec0cb64ad94..ecf27c1120f1 100644
> --- a/tools/testing/selftests/livepatch/functions.sh
> +++ b/tools/testing/selftests/livepatch/functions.sh
> @@ -4,6 +4,8 @@
> =C2=A0
> =C2=A0# Shell functions for the rest of the scripts.
> =C2=A0
> +export LC_ALL=3DC
> +
> =C2=A0MAX_RETRIES=3D600
> =C2=A0RETRY_INTERVAL=3D".1"	# seconds
> =C2=A0SYSFS_KERNEL_DIR=3D"/sys/kernel"
