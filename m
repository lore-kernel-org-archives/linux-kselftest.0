Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.178
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793800013;
	b=iZKA3vkRkyaEVMHpU6LCZFZGnMSQEB4NOMfAkBec2Rm2avVZtwlOyK+1DLheMz7Z7yFo
	 SFSR8cS2ygYuwALdKXw9UXj6+M/d2Yty2Ejusg7vV9+MpiB50/ehaMzyCbllKMNVByCtF
	 T4NG4i2f3TuWz7yQIOavODIH/5PdwXDvuXCgESIXvcVKVPCC4q2P0P5BqMeXy9/0PhjEj
	 LZxEBWq1wqozQjTyVs0AeLXXPYrVmpWO7oKzpf/ZWZoL06iydXaTbtpTrE36vM3BNa/x6
	 ILJuFeFNDgrxhpmxYSd6HFl3bqfn8ka7w5itPTi6FACHoO8b2nlZbOi+1CJp1atxBaA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793800013;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=s2YgA9eXRC7gTaeTWC5JF61ATLOugSgGfmlk7hXTAN4=;
	b=pNsFyIU1tDDdy+g5v8fqjVXntO715lZPRNotlO7QCBXKmjNtR99BCi3LR4p//W8D8u5+
	 Fwwo0fvrChoEa1+PrmeRwzBllBJqWw/nXO1jGMP9xoQsTbHaAh34/PLTKapmboatyroLa
	 qdB/IFEnSjIW8E86TIZNQhoz/gA4jRoYW8df9WhozL724TjCmclTZb3OA0E8MGSCfDPwr
	 dnPSygDxbLGecAKXKQhwtZwEHesoRK5/XarrsVsQ0Z2ncdvwJT3O1NF5OTDORXESqHRxY
	 GpPi3MOqutoO+s9EhVQtrvYelHTtwioQ/3o9HnYX1q3D2pgzm2bDwK3UnlMkEIwyAyQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YikxubsO;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28C1D606A32C
	for <linux-kselftest@vger.kernel.org>; Wed,  4 Nov 2026 13:46:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28C1D606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YikxubsO
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-353804b591eso1309117eec.0
        for <linux-kselftest@vger.kernel.org>; Wed, 04 Nov 2026 05:46:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793800012; cv=none;
        d=google.com; s=arc-20260327;
        b=X+X3SnDysg6bNW6D85Emw6Oe+j3Y+oe8tjLSQ8PaEZ7aVD4BER44LXJCPB3Ws/QZDS
         MWnLo9pNSuF9DRD41Nm5r5uet8U1eUh8SbxguScuX43ZlkfSiv3lIKhLFUgTsO42R8sf
         2ooia5Fb37bqcHnlI+EYYsRtYMrTKrIAQXFABF/C5u1tKn6zMASUGt83BzsirJB/6eQC
         sso0RnOIvnQkmYTW9WKdZK2T7k0f3fOhxCzxkIZb0dVQmqzfK0DCB6KO6F5Dp2rOsDB3
         NGelEeL5PJVJMuUvXB/cwYJzrE8vECocgW7vtDDoyYqT98h5qish0awovcjKfZukSW8d
         X4qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=s2YgA9eXRC7gTaeTWC5JF61ATLOugSgGfmlk7hXTAN4=;
        fh=OV3GFspywl0dE+cx4lfTyElsccuqyILx5+xFDGWZslE=;
        b=iZFLiFYSN0m2nPFARi45rtO7O6rc2Aw/649KNZqkirTePevkpeEJF8mxFzj9FWfZBM
         lPLvUcmPIYtLIbrqqZiJDEaKFYRffdNwUIQJBqiphKqTJbSu3ZPdkN00Z/rDVR+/xq7C
         yoYz082eVJDQzrQqnyXhrp5AxieP1X6H5M+PDXMEDV4fm1jYR7KRou7F33+sW9Pb+srd
         nL2OBEXzXEnsiESFh2FcAUnPlxlS+zFCGl5fDSEn1tLWmjPbh4Oq3QCE/BvKWdPB80EF
         7pYZB7Ua6iD4HIFnaEGSml1tLC3WdC6Usd78queF4cPL4WYdZ4zftsarsoETd3hyAIaE
         UqMQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793800012; x=1794404812; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s2YgA9eXRC7gTaeTWC5JF61ATLOugSgGfmlk7hXTAN4=;
        b=YikxubsO8EW9n9tgtdFn4dkvgSt2iwtCQEraYsgw8D71xlFrgPfYSMq1hxz+s/Yjg1
         zqBWBjR3tpfKTJp3ibtGGOsdlGdO0fIg/Fw75u5adVIyd6nT4MrAqrkqBttWuq2QIRUE
         QR0dtqTzhMsrcJDTYQeID3xZ46xXUUzKBbuN4ovMfy3AYPsFwO+kXzFOEOmV9oyNcJjX
         Eb195TYG9btwnRBpGYtGMBQWm0+FVOndqpHbUzqCF42cbCIB3MWYtCGL2WXEEh/Hlgij
         MgvY/5roDMeqGTyW2sjfSHVfdevj4KaI4HdK0CHCLq23WasgWMnFBeuYHVQ+E3fdsfSF
         jGJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793800012; x=1794404812;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=s2YgA9eXRC7gTaeTWC5JF61ATLOugSgGfmlk7hXTAN4=;
        b=i9J+4DfiHV3GedYgV5VSWvSH3iyKDpngyD9XvUyhI+GzssyLhiCrBFK863xAtW8MUs
         obswq8Ea1zisMtqpd06kG2bOkCJ0Lo2Yod5MAuVebtdIogD0I3JKr4ZZITFo7pI9sCxK
         4Ck1BEus+g9TAEZXf8dFz+Z1+fx3/qWrJz8up35Wdxz/RkLOPXNmvG8dH8ZG3x8FyOOV
         Gzq1TMseCmzTl1kZsff8BrmCrsmrXvpKRKHczT1WjXJ5qx9XYRSkjr9etpAlWURX3epK
         rlAEYzTtP2G/3Zv1KeChLm2jKJCJ6HPGPBS6b6xfGsOJsx8NSpiFhIjVZNjnuJ2a4rng
         bj2Q==
X-Forwarded-Encrypted: i=1; AKwUvBwINsK8QJAKcrJMqIi8OGwvB4KXGZI2nk6I3g2i9NE+8qAwZwB3AjXfKKTPtthusrLIotas2m2ec5sAjbYjd9k=@vger.kernel.org
X-Gm-Message-State: APuU4Z/kUDAZJiH2DAD9EPN4LuTnFSvbAZXK4Yk3gLFVFKHwBbV/C4j9
	lEtgWhFnmvEQQo84vaRz3zWkdhWbXeIWWqfC/iKEcaBTQ0c+lyb7RKyVv62BBCYELyLk0XI82+D
	v6Jds+98MKY/GN7ES5DwCUeLzHNppQQg=
X-Gm-Gg: AYBFou0YFZECrFnkFmVCJgaE15kIn2WqlBZF1MCmG9AK5kQ0NZ20UxQnPeI/RxkZO7w
	0Pd/6qr7/NHa5cer9DfHtltuKhA9sg8Ty9N6ovi496UmTyj/hkLFmSGJvf7JHxsiwns87fZ7f96
	dFnREodFikBtPfB1/T2NJTLMzd/Wb9jchncfCNnoNDZaxxK0rgAh6D9ZAgLymqrm63vUdTxscvr
	VAlkbEVWfKk0hNeLibj+7Rdb7u43wWqIlMETgnI90XgFIRyrIuHVOrA4rO+fkq1u1kN4W3GrprF
	V4xv5bDBOhIcnt78wMnPGQSPhvROacWTwEdaUGGVj5K44gi7UnPf/Zw1tZ9as/Xhl4BHfu3iWgb
	0NblW5PLQcjF8TIyoND3Kg3jjSoHENElx1edy7jpqjaMphRdd0D43EUblI7rE8uKXzaqJxzWUQt
	jjGC71tPTXcZzEuahBZ7cx4XKmZVv969mYtNkXHY1QJ/U1FFZ9kxdKUz7aXbL0cUzHFtnTjMiou
	LafTk0=
X-Received: by 2002:a05:693c:835c:20b0:36a:30b:5dc0 with SMTP id
 5a478bee46e88-36a423c338dmr23659532eec.24.1793800012108; Wed, 04 Nov 2026
 05:46:52 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103165419.687806-1-sashal@kernel.org> <20261103165419.687806-6-sashal@kernel.org>
In-Reply-To: <20261103165419.687806-6-sashal@kernel.org>
From: Dmitry Safonov <0x7f454c46@gmail.com>
Date: Wed, 4 Nov 2026 13:46:39 +0000
X-Gm-Features: AclHuK90WkhgmJhmU6xdUm7mCsob0Cru4i_Y_AMzLhb5jcxjClGipAhE9WgIpYg
Message-ID: <CAJwJo6Z9qvw4Mig8Hs=dhMyjnZ5UPS6sRbKvnfFVqkoX1iFXgg@mail.gmail.com>
Subject: Re: [PATCH net-next] selftests: net: tcp_ao: make the netstat column
 pointer const
To: Sasha Levin <sashal@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Shuah Khan <shuah@kernel.org>, netdev@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 3 Nov 2026 at 16:54, Sasha Levin <sashal@kernel.org> wrote:
>
> lookup_get_column() stores the result of strchr() on a const string in
> a plain char pointer. Since glibc 2.43, strchr() returns a const char
> pointer for a const argument when C23 features are enabled, as they
> are with _GNU_SOURCE, so gcc and clang warn:
>
>   lib/proc.c:61:16: warning: assignment discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
>
> The pointer is only used to compute the length, so make it const.
>
> Signed-off-by: Sasha Levin <sashal@kernel.org>


Acked-by: Dmitry Safonov <0x7f454c46@gmail.com>

Thanks!

> ---
> Found with gcc 16 and clang 21 on glibc 2.43; KernelCI's gcc 15 builds
> show the same warning.
>
>  tools/testing/selftests/net/tcp_ao/lib/proc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tools/testing/selftests/net/tcp_ao/lib/proc.c b/tools/testing/selftests/net/tcp_ao/lib/proc.c
> index 8b984fa042869..50062b527a393 100644
> --- a/tools/testing/selftests/net/tcp_ao/lib/proc.c
> +++ b/tools/testing/selftests/net/tcp_ao/lib/proc.c
> @@ -56,7 +56,7 @@ static struct netstat *lookup_get(struct netstat *ns,
>
>  static struct netstat *lookup_get_column(struct netstat *ns, const char *line)
>  {
> -       char *column;
> +       const char *column;
>
>         column = strchr(line, ':');
>         if (!column)
> --
> 2.53.0
>
