Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D00DF22B8AB
	for <linux-kselftest@vger.kernel.org>; Wed, 11 Mar 2026 16:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773246681; cv=none; b=N1qi1FgHr7rtJzaAzk1H+3kYsTheBI0FjtvNNP0Dc22pabjaipmYmWv2OlPWfpdaa5fkxyzUbRZCLsKmL/9d0J4SnKsulF5pXMuJ3PsiTeEJhg3tAZ2a52OEkGpi66gjxUCxrVfWskWFKYnN+BnlViKsHt8V9WDKAYcKsluNhPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773246681; c=relaxed/simple;
	bh=Kd2o1aBEobvspvm60zCAF7juO/ZjobOchZgqbSx1vIM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=r24Xu92iO6oNpmxEVfIVhT5X76NBcikavKraElaRA5ozv/qPaOSAYq9zBCOezKN9C74c+JnyMUgXt3vl6OhzKnu+ZLGpHS9HCsTGAr5kmL26jiq5vE1s3laZ17bYkY+4ig4JOp3JRxJkn+CdsKThoh0ejxOCp+FcmMt3we/zy/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cb3qgogW; arc=none smtp.client-ip=74.125.82.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cb3qgogW"
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-1271257ae53so5311c88.1
        for <linux-kselftest@vger.kernel.org>; Wed, 11 Mar 2026 09:31:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773246680; x=1773851480; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Kd2o1aBEobvspvm60zCAF7juO/ZjobOchZgqbSx1vIM=;
        b=Cb3qgogWrAS2nG2no+ttZFOwVLlRLl8W+29UIzO6at+gdjh7XQ9MJvzOLuGzTsP5LU
         7WtjhlUX7qlb1HWtHpaF/m+YzBja5iWY2jpdeQcy3cawQ4hQYFmVqhzFjpu4E9px0Rf0
         VLDOakntGF4qjy8U6H699pFTnMKTI/C+T4RvJE8JFtbUPjlKgZIK6a+1+8aZKaawK+Ek
         EPh5LMX+vPgMjqbB6hstBggMwE5F9BrM8S/7UgUiDYAGKfYoPtMXtXR51HxGhDMB+Yle
         kzxNyfFlDh1TDXAZ1Q+LlUlXIRdW59GOWhuPDXi3WQuNPQXuAf6z21Ay+CJeoeWFNwVx
         7IWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773246680; x=1773851480;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Kd2o1aBEobvspvm60zCAF7juO/ZjobOchZgqbSx1vIM=;
        b=cRxI1+d+u6aeDq79N1pjfijzNouJpe2ADV1hMt7EucJ3mbLSqa0aO/CbhexVfcpNW0
         UQE7WHiHmROgDkRxF+OQMCSz1b7bVBLxDyfKThAqlXupLSUvRqF9LFmyNpX2xCyJUzBB
         1dsbiaKpZTv4fyQC4WthO8yRzP0XqI9XEMHbXf9ueC9FL2NIo2MJG98eYUR57HrA2Qwj
         Ac9ob0DGupNE5e7ZlUzrW7GVzdwD2qSy+es/api/+LZU1JdgzH/TNQNcW0bPl0Zd+Ypc
         7a5ROBwsYsr+Nqw0snVLLYYr4Usnxq1CMfuIpMefbEEqNqSoqo5KLsVMtrvMQIHTuc0z
         p7wA==
X-Forwarded-Encrypted: i=1; AJvYcCWs+Cn4822XTKodQsQhYDiVVevNainT7Hs3Vd2MYAsX+uC7GuyQcf4n/JQAhfVwiqX7XuHa0TDepx781nNAbys=@vger.kernel.org
X-Gm-Message-State: AOJu0YxoRchnJ+YNDNdtUknu5S5S0JnEF9CCxBJWykknOTDqTD/b0sG5
	T80FkgJVeqxWqna2oc3zP7bT87l+t0wUSx6gm6vWoQtCT6Eo6//GwBOC
X-Gm-Gg: ATEYQzzUZaZ/U6Xh75OHBl8sS4sq2EprPq9qmMr7yE5H8dEXAudRseU4AoEsUK/VzPg
	H1jTg3DiqwWlPUUvITuMQO6d9CgSSwfeUvyfSGqZbNFbA4Wzko03a9Sjh7wWSS1f/9cB1CzmVms
	zLvSm9p0i9HbVibLknPRnj0fz6YXSnLg8vc2XVZ4/lXfLtWhm74qJgw/iCHat99QxyRVKorldtU
	w3Fs32iANIdScNOFsyYc+6x6p5BRdD+5tCfNM9BvR6C4i125sU4jiTEavgUW80OGw6O9nqWHKN2
	zYuZZOxLB54SA0tz7VHLgUyMjs/T0SPW/BlxfTcQmZM/0y+ApbKk8M4lP6Qpe6U6AOL5RpYDJ02
	HJ/8xl5nHzqtEChnAjI+543EP7gmUHZrfwS2srecD5mI2KFbjHXR+NzVbmHyBqtZ6XNi1wVUztE
	AmzRp6LTmV+tbCuA/EQJXnqpXwGnPZI6fQ6JYoHC3SoA+T9I3QlhnI2aguo0EYA1FzWl/JlodkQ
	tez3R8=
X-Received: by 2002:a05:7022:218:b0:128:d7a7:526e with SMTP id a92af1059eb24-128e77ae81bmr1331880c88.13.1773246679819;
        Wed, 11 Mar 2026 09:31:19 -0700 (PDT)
Received: from ?IPv6:2a03:83e0:115c:1:7458:e476:e695:15f3? ([2620:10d:c090:500::3:a69])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-128e7c1780bsm3445083c88.7.2026.03.11.09.31.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 09:31:19 -0700 (PDT)
Message-ID: <55f48be8727546631aebacc847bede5ce2de85c4.camel@gmail.com>
Subject: Re: [PATCH bpf-next v4 1/2] bpf: Support new pointer param types
 via SCALAR_VALUE for trampolines
From: Eduard Zingerman <eddyz87@gmail.com>
To: Slava Imameev <slava.imameev@crowdstrike.com>
Cc: andrii@kernel.org, ast@kernel.org, bpf@vger.kernel.org,
 daniel@iogearbox.net, 	davem@davemloft.net, edumazet@google.com,
 haoluo@google.com, horms@kernel.org, 	john.fastabend@gmail.com,
 jolsa@kernel.org, kpsingh@kernel.org, kuba@kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-open-source@crowdstrike.com, martin.lau@linux.dev,
 netdev@vger.kernel.org, 	pabeni@redhat.com, sdf@fomichev.me,
 shuah@kernel.org, song@kernel.org, 	yonghong.song@linux.dev
Date: Wed, 11 Mar 2026 09:31:17 -0700
In-Reply-To: <20260311130711.33966-1-slava.imameev@crowdstrike.com>
References: <979c7539ac475b3c428f609066e947844b6dd8b0.camel@gmail.com>
	 <20260311130711.33966-1-slava.imameev@crowdstrike.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Thu, 2026-03-12 at 00:07 +1100, Slava Imameev wrote:

[...]

> Adopting the view that vmlinux BTF is consistent, we can replace
> btf_ctx_access's condition for inferring scalar() for pointers
> from "if (is_void_or_int_ptr(btf, t))" to
> "if (!btf_type_is_struct_ptr(btf, t))".

I think it should be fine to adopt this view.
