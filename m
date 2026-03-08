Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59A581EB5FD
	for <linux-kselftest@vger.kernel.org>; Sun,  8 Mar 2026 10:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772964083; cv=pass; b=Ea/vvHxieMEuN1y3IJZ/Ag9qPZ1iMcFfNTAKvAh7DDWR0+yy9ViLsA/L78Z6YMAsJwD0aN6QPM6qls5YS/xaqR0pOQa0pNRc080KFOKbgJWtZJ0FDUP9nvYwessEmsm2LbvU5yspQNK2nWGzpDTjo/adCxBhTbydUbltqDooNTo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772964083; c=relaxed/simple;
	bh=b7LJSKV14IjUILcevbUXEQrSrJc8p+kP3/Pcv50K3xM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CBfMWNkvtF0I1tByiAimBM0S0ni0Dbh/9I0sJaaq0gQdFSv0tRBZfKLe70FRw28vR0r536entMshlfvDYXCsa0GKqEMIqQgU8MiWwmIqY1c2ustN7TV3qrCil5M4D+7ej22M/ydU4rIZpnOehA24jzVkOE6ASsd/KzVMElJKmsU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mJMYT2K1; arc=pass smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mJMYT2K1"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-79868cde1eeso116806387b3.2
        for <linux-kselftest@vger.kernel.org>; Sun, 08 Mar 2026 03:01:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1772964081; cv=none;
        d=google.com; s=arc-20240605;
        b=jMODCzzaw/lLPMPkM7tSqAzuD5wv8fQX2HjGViGbTucpVBboCkAnx0t3KpiXKW+1B6
         RezILnxmciPOays7OdQNCYBGEduq6O5mDAXYFBjlOR2/Hp7lciStO/HzFIwfzbTpOVn3
         H4DkqwqU+D+Tu0qkCxL8oRmPAN907IdBQhWRi+/KIamAltwgV45QQT7czBfwUoa6ix+N
         mWpIHL7XhJzvqYmEW0KZtIrgA9EGNidkoUvmFoPhxhtfUL25yhgTAgOJtZdA3hblkWQ9
         44TywGBUqmE7zQtFGxWn6AppwO+mL4MV8tQUyE5QReDOJaJuDzIwOmwOEVcKVzxpxweA
         GykQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=b7LJSKV14IjUILcevbUXEQrSrJc8p+kP3/Pcv50K3xM=;
        fh=603lEt0TvGZVp/enE6U1M8yCwPZy8fZJMWhx1yIgGtQ=;
        b=A7kma9uxnma72wFb+Xfy/zgo5vCzvUhcPKSXuHqVukSHi6ljScBGlkHqZFvlc0LqPo
         X13wgWWkBNqL6jXZVYZmsqcONLvFKvhcmSLtPE4uLVUYgL68KyBZsXNoL54/v4E6QkFN
         +1AEB7Db8UA5zC41T82scl/Ga/ZPh8QCAReGL1EMjYvdtZkAbhzpjqXjwaVKDebYRwhF
         VQPIA2UlQnSXxNT7n3S3IxZB+LCPQSpvz5e8+7fpPEdCJwMZUYNAo3FSHKfrDtr2zjY+
         9SNg8O4vJuC74v4ZhrvalEdY8arN8pmrFO0WCdoF6m+ZCd6ogrW/Kb45tqeY9b4KzfPo
         4f9Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772964081; x=1773568881; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b7LJSKV14IjUILcevbUXEQrSrJc8p+kP3/Pcv50K3xM=;
        b=mJMYT2K1velHbWaUWxR8X0ITgQAID0cxfoU3jo8u5A1mCSaGBYFN0Ja946kBZDvAhb
         nUHK3e2tRVxBkEnS1++WwTUAaM+UaXwhHYiE2lU6FfEed1lWsuZmLaOJ1Syt5IUaf3Ti
         YoSwkxwGeiXZit50eU4S0d082b4hcB8kcywtetKU4VO/vCsDiDdQmHB5lKCnXWeVMZs1
         CB1Y4oHKe7PBGxrVvIXwLmLQdxntTOVjCapfatA5hpyly32BTOd08Qr/G6FUfL+v8tXn
         XikH5TNgrc//8Qo/oWit2a1HFU0ymO1vZJcgB9eAtqAcZKC0w9hJenZ0bBFtN43gYmxD
         Oc4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772964081; x=1773568881;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=b7LJSKV14IjUILcevbUXEQrSrJc8p+kP3/Pcv50K3xM=;
        b=nHwOg4EHbumk+pm64vdh4/IqRiRcgjsJdo4KUu2VZiweghtriQ36c195fjnsEp/a1y
         fZPNZl75dwc4J+EYUlgKrmkQn7oMDsEvDlPXxslk7nh9xduLdMhANQ00x7CFoWh0Y06e
         35JTU584kAbjg06ONOQMRPgJwSlJ1sWws/CUMeDJKm/PEgg906HvsQ1HZRhictv10hZM
         ZUW9wxoDuvBxhpW0j6MJJWwsBs+nNJMcA2l6eieTtMLmTzXwSctieXu6fkx+UWhV1IOn
         tOt22s+nMvSY6oXGEKQ4vwULKqIwx27xx+OuQe4TyIk+eDoJVmF2zLMvZt8d3xsRHV4C
         itTw==
X-Forwarded-Encrypted: i=1; AJvYcCWj74ldM+f2xTUhXkEBFXl4H+NOEXHASpkcCqHx8jOvq4fT6yyb0lnBCB/ILOo9ezFlEXXSKqVScl5AqHT71oQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxCYb6r7AC9FWvOD7pWBqpcA+RSskXE2RiW2bvPHQ3ONRy1aRPI
	so+2ADjzbIK4ErY9WaMi5I3M7kwgka6ho3mfKIX1G/TCFi3qUuyzTTYCZV5hVgLD9LSnY24tROb
	dIixBr55BuK3JxGzv9kMLfGHgyRLUIik=
X-Gm-Gg: ATEYQzwVFdcA+WFmZXDVTKBCbOtRLs5GxT58MfaDStTPQDI+Z1dCpkH0a3iWo12pT4K
	ep8aeVtFKPVXcSt8amgQJ1D11VwCkAP3Ill2to9qtQmQa3ybjCNAErW7jXFblNvIyeFWbQkzor1
	vBAI6p/2dx4XNqS+dGwt9etaGKPnzQimjI18DEA407i2PlxaFN8z5Pjn8b1VjG3zWd5cGEoflSQ
	oOYe5ZDVFuGfdkoy4zOpd3UYBZ/lT6du72BD+oRL932kX/7b7V7aX1CvnpfDLJNbdxERc3teXAx
	kfJZzooZ879DDw==
X-Received: by 2002:a05:690c:34c9:b0:798:e620:c4c9 with SMTP id
 00721157ae682-798e620c55emr44448907b3.50.1772964081228; Sun, 08 Mar 2026
 03:01:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260306120024.1032301-1-sun.jian.kdev@gmail.com>
 <aar9gzh7QVhezeII@Tunnel> <CAADnVQJtG9s1CV-qeF8NSgi_UFPgahOXtB3PWiivBooAYC69GA@mail.gmail.com>
 <CABFUUZGV7ZAVY=Y6Py3ytZUzZV0i9otPWADgP9HtVrDzf612ew@mail.gmail.com> <b45c98d4e59bb31c3101d6ae2ef5d7cee8b4f6c8.camel@gmail.com>
In-Reply-To: <b45c98d4e59bb31c3101d6ae2ef5d7cee8b4f6c8.camel@gmail.com>
From: sun jian <sun.jian.kdev@gmail.com>
Date: Sun, 8 Mar 2026 18:01:10 +0800
X-Gm-Features: AaiRm50KjtWFkDZgofmR-lB5_TXyaKS4c2EWK9-h6YthclHybfyOLwRYlyUqjSQ
Message-ID: <CABFUUZEZ1ZLP-cgS542sqnoRT7bu=niFCrUU+YOVEHLLGaKOdA@mail.gmail.com>
Subject: Re: [PATCH v2] selftests/bpf: avoid jump seq limit in verif_scale_pyperf600
To: Eduard Zingerman <eddyz87@gmail.com>
Cc: Alexei Starovoitov <alexei.starovoitov@gmail.com>, Paul Chaignon <paul.chaignon@gmail.com>, 
	bpf <bpf@vger.kernel.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, Andrii Nakryiko <andrii@kernel.org>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Shuah Khan <shuah@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 8, 2026 at 4:12=E2=80=AFPM Eduard Zingerman <eddyz87@gmail.com>=
 wrote:
>
> I have an old investigation for the pyperf600 failure reason from March 2=
024.
> Attaching it to the email. The discussion happened off-list.
> The source-level "mitigation" I found back then still stands:
>
> The decision back then was that the "mitigation" is too brittle to
> apply and we should leave the test as-is, hoping that verifier would
> get smarter some day and be able to load the program.
Hi Eduard,
Thanks, this is helpful.

The write-up made the reason much clearer to me.
Let's leave the test as-is.

Regards.
Sun Jian
