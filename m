Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 393CE3C944B
	for <linux-kselftest@vger.kernel.org>; Tue, 10 Mar 2026 16:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773160734; cv=none; b=eH6wSicrdm4akGEokLjxplNSKW+dZna5b1fPigSUF3cYgJQNeUYd6BFZWBfVv+NgBW81Lu79XB5HXLPJgxSBYCWqlwG5AX7jRFxq6zM3500qhnblWHWhRcFY/1aEXMo3Epe8g2UWDV31YWWG0GAprnKG9hBclayU7dHsDINfDEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773160734; c=relaxed/simple;
	bh=QtsqEkQzN9xVOyxOhg30955iCjs1Cv5lnJJe4hLbfB8=;
	h=From:To:Cc:Subject:Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Type:Date; b=CBb6B8+KnhP4ruOljoFzwtMVZ1MGTgyJOlVLMr+ng6xtLANWxlfC/yxBR77QsO51ZC+/mtatVO8NuFqSh6ZkTXOwXZ5/32us6EgDsqJTgIAko6UkB+j90qozDlODcONdGVZKm8kCBr//o/w9+2JQ3jnPP+84x9PDY1g5RlRdAHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YJlCKPYd; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Kq6Iq6L0; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YJlCKPYd";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Kq6Iq6L0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773160730;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jKyIeeS7eeZINByUKTL5F9SGyjIIQhwCa/DKj3QwiDs=;
	b=YJlCKPYd1RJMyRTpl22zH30eSUarCOEaeFKXKHaISogBEC9qQPkiLWPgqcn0D17kcM+PBw
	ORes1B+Jjk5xbOAybv9mrHO2pYf940v9sziO9w+qtq5V139KJJ/NMO/Px5tATmGHsibBY4
	JVGCTEGtSLD+pU0dJXoDn6RM89mXjsc=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-613-45bHHosRNdWTRF3a9UUANA-1; Tue, 10 Mar 2026 12:38:46 -0400
X-MC-Unique: 45bHHosRNdWTRF3a9UUANA-1
X-Mimecast-MFC-AGG-ID: 45bHHosRNdWTRF3a9UUANA_1773160725
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4853b00f9f5so20655725e9.2
        for <linux-kselftest@vger.kernel.org>; Tue, 10 Mar 2026 09:38:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1773160725; x=1773765525; darn=vger.kernel.org;
        h=date:content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jKyIeeS7eeZINByUKTL5F9SGyjIIQhwCa/DKj3QwiDs=;
        b=Kq6Iq6L0/0WosQmwNuR9Gk+TMMLNnZKVAIbrzlA4abYMFbKgv5JdDYbsQcaKHYl3Gn
         /DyE5M6D+kRzWcQ8act/U3Id93mlxzS4YtKC6Ja2Tm110rE80N+TnaHKV88o6P2llkCQ
         XcTAN+FGdRZwV/0WYi1nz0wN/LlsVylWUbk42CRCChQjqjBGl5FG7Laq5VWs0xySZH9r
         luPY33nyHCZIb19dlW4W2tLkE1ykVRStZY0IdJ3wW+zP16PM97wZtqNV2m8URBC4y2JR
         LpyTQGg9T67eh/1c8ccm0uqZ7rgA/yMjLec8asuiLS+sIlGoSugeN1qj4sLfkW9E82x2
         dTwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773160725; x=1773765525;
        h=date:content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jKyIeeS7eeZINByUKTL5F9SGyjIIQhwCa/DKj3QwiDs=;
        b=wtvHPt2OdpQeXBJuzEhLZ0xZmDQZbYRx2jI39eN6IiPWCE03F1cnJiFyonFlW13Gnj
         q134iL3bDt/hjXSsMJXsF0ZG+q9lHQ4wLXvuETgaSpeDsKA6XKvLladQS0Kou2DkVFzR
         RhuQM0Yqmgveyx5yik6UxF+ePbeR1soNlupr098tNTd/AHJxMp6e3c9EFGMH7Fpj5Gt8
         EJG2GRktNSNPntOPfi0+Nz7Se+2EsZR0R8wrOWCdxJXWecXBkBiSUo7PSryEHXUaXGrI
         /gNNWQ6Q+D/EkCZko1p8kAiCjpCc4wr6DKEMEODbuRDog0wf4dX0Li1/KQ5aEvNYkb08
         fY4A==
X-Forwarded-Encrypted: i=1; AJvYcCUzhx0RgU5OoVlSo0kV463N6inkbXPP8BeZKD22NHHQb5tmXxXcnOSwQNuiuySwartW8aVZghTKpEREGvyqSLg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZLrP8m+KRuTHhyNz0NguUpzMBa8TTViJnOdQpShq4WVnnTSkk
	Txk6WVzNqHUteC/PF2pdKFdSlI8Waqmdd/qTxIgsdUj++MZPnHdfC2GthSsQSRkexBd2zecIDXu
	UhXBMLr/vPL+bHPTLytVBpU7WVX+0GEeZJzldcRzg8vUBKW53bdiQiCI4PLxvDzKmNOQi8Q==
X-Gm-Gg: ATEYQzy5BeYQ3kAZoyaps/FrteHv7aXF/F9gE2VuClesvnTzdKqweX9HSmWBDcl/kie
	fX/qT0qSyy2593rlXMd2pEucapoXxcJn5FgKza12gTBZn/z+fEBzcT4q6WNFDVJxWvjRVYrO7kr
	W1ctsr0e9FaTWyHEAWyLFNYzhP2mIhHrlmr6WemWKCgdl9R3ZM958i+HcELMIBP9qn8GrguTsdK
	nmlg6Ej+ztq7GkXZXonnsw8yBIzK2fcE+elN71k1vVcugRgWijDQ8dO75eBr/WB3ujNmz7O5Bq+
	Npb6DoOjsZh1p8B/xYD2BZZG34CV3TWIJ/qy7VxsSs/LQwFzhkD+TwMSTVazvWxUqYGvwPz40Wy
	yr3nF8vf5j5JUMtD1sWD67w1zh5fXztDSQ5GEDO6HOPkclDThSg==
X-Received: by 2002:a05:600c:4ecd:b0:485:3c2d:d02b with SMTP id 5b1f17b1804b1-4853c2dd2e5mr116584485e9.22.1773160725300;
        Tue, 10 Mar 2026 09:38:45 -0700 (PDT)
X-Received: by 2002:a05:600c:4ecd:b0:485:3c2d:d02b with SMTP id 5b1f17b1804b1-4853c2dd2e5mr116583875e9.22.1773160724742;
        Tue, 10 Mar 2026 09:38:44 -0700 (PDT)
Received: from maya.myfinge.rs (ifcgrfdd.trafficplex.cloud. [176.103.220.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4852470c697sm116693875e9.31.2026.03.10.09.38.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 09:38:44 -0700 (PDT)
From: Stefano Brivio <sbrivio@redhat.com>
To: Aleksei Oladko <aleksey.oladko@virtuozzo.com>
Cc: "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, Shuah Khan
 <shuah@kernel.org>, Aaron Conole <aconole@redhat.com>, Ilya Maximets
 <imaximet@redhat.com>, Eelco Chaudron <echaudro@redhat.com>,
 netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, dev@openvswitch.org
Subject: Re: [PATCH net v4 3/5] selftests: net: rename pmtu.sh to
 pmtu-test.sh
Message-ID: <20260310173842.723df058@elisabeth>
In-Reply-To: <20260309152013.565216-4-aleksey.oladko@virtuozzo.com>
References: <20260309152013.565216-1-aleksey.oladko@virtuozzo.com>
	<20260309152013.565216-4-aleksey.oladko@virtuozzo.com>
Organization: Red Hat
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.49; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Date: Tue, 10 Mar 2026 17:38:43 +0100 (CET)

Nit, only in case this needs a re-spin for whatever reason:

On Mon,  9 Mar 2026 15:20:11 +0000
Aleksei Oladko <aleksey.oladko@virtuozzo.com> wrote:

> Rename the pmtu.sh test script to pmtu-test.sh. No functional
> changes are made, only the file name is updated.

I don't think pmtu-test.sh is very descriptive. I think leaving it as
pmtu.sh and having the new pmtu.sh named pmtu_run.sh would be more
self-explanatory. But it's not a strong preference either way.

> Signed-off-by: Aleksei Oladko <aleksey.oladko@virtuozzo.com>
> ---
>  tools/testing/selftests/net/Makefile                  | 2 +-
>  tools/testing/selftests/net/{pmtu.sh => pmtu-test.sh} | 0
>  2 files changed, 1 insertion(+), 1 deletion(-)
>  rename tools/testing/selftests/net/{pmtu.sh => pmtu-test.sh} (100%)
> 
> diff --git a/tools/testing/selftests/net/Makefile b/tools/testing/selftests/net/Makefile
> index 605c54c0e8a3..8fa6ef771757 100644
> --- a/tools/testing/selftests/net/Makefile
> +++ b/tools/testing/selftests/net/Makefile
> @@ -63,7 +63,7 @@ TEST_PROGS := \
>  	netns-name.sh \
>  	netns-sysctl.sh \
>  	nl_netdev.py \
> -	pmtu.sh \
> +	pmtu-test.sh \
>  	psock_snd.sh \
>  	reuseaddr_ports_exhausted.sh \
>  	reuseport_addr_any.sh \
> diff --git a/tools/testing/selftests/net/pmtu.sh b/tools/testing/selftests/net/pmtu-test.sh
> similarity index 100%
> rename from tools/testing/selftests/net/pmtu.sh
> rename to tools/testing/selftests/net/pmtu-test.sh

-- 
Stefano

