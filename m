Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793158725;
	b=KuorxhGYtnhlTftKfwXp23W8WUKflxLXd53HG5X1Gu77N7HRhkgJDDFWXw7zsVerU7zK
	 jYiAUaJnEWXCQhJ8U9tcsLEQj7hpIDbfhUfkS67NnlD1DineTnJMzF4eLQxAktQQ1gLN8
	 V1eIA/AUOhYq9F6ErTSo9pQMXVTVXhWv/YkwV2cZmSfWG1Utaeb8z1/X81MwXVuA9633P
	 D//Kh1Pb6kP7AkwzzcrzdUczAlqz47QHTMbC0DwP+zRv4egAUk+SvwLNrdBa5VL5O1BAA
	 04CCTG9Wm8Mq3QO/gvFn50ASTsBevJDhd6aY7tsJiS9ofRw1ayGeOSF2gGqnKxRtfxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793158725;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Content-Transfer-Encoding:Message-Id:References:To:X-Mailer;
	bh=VQJFWsO2O0YbolYW05VDBIkhficw7DwnVaUUdw0UKuM=;
	b=SoAjtgeY4SFrrfTri3FoiJ+ovtt07HazbztyPen5eX5fj55tzVew9HuFW+7UHh1oRNGr
	 6+Jb/ZInPCGQSdQiS5LY26YW8XzbQxl4qhnA2eXsG5B7ZJ52MI+lPBPbEwUA6xQS7Ux7k
	 JElikZkmPeh7gr/kPRPCM6beHSH40C3l6rL9XxZz1CjmUoQRLgjc6Dv7XNeUBF+ae83Q/
	 NYFU9O6ugMz5IrCRir4DkUm6+QcCOordE/L2fNUbAu0MEwER46GgwtsCTjE/PWnYs96nD
	 kUSkPEOgQSAcqMd1ytmrNM+4s9sQvkDBIMeQgon6Y/ghRm1G7TKsiWORZKnZjBtGYYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kpXTMhRh;
	arc=none smtp.remote-ip=209.85.214.178
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A18C2606A31D
	for <linux-kselftest@vger.kernel.org>; Wed, 28 Oct 2026 03:38:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A18C2606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kpXTMhRh
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2ea1e7fad99so2776895ad.1
        for <linux-kselftest@vger.kernel.org>; Tue, 27 Oct 2026 20:38:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793158724; x=1793763524; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VQJFWsO2O0YbolYW05VDBIkhficw7DwnVaUUdw0UKuM=;
        b=kpXTMhRhTD0FmK0+Tjl0Em4BWm/lyKJb+frQFOxvez1rlXCx39Mwq++SjA21V0vDEx
         Rsgjc2ofwsAUcM8LYToGox3wv4FFBgo4U5UmA8c73iXaHbkcn05wIsJnE7Nxab5aZQVr
         OBIFEe8rYgqsKEQXvfygKrbJh9S04b1Si1sAadYfYJVEevNDvex+hiYBwSlu6nqWCyaA
         BS5iHOlxoj5z9reaALRU1FXhS17w4BQWqYd4U+6425KuO+rThn4nNkiuERSOFJrnoGLt
         X9WYqaXBlHChn6/K5DMWMT+yz1xqsXP2zwE3pCaptODUD4DUcJ8S7r5ixJXN/gVpXvhF
         Bu0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793158724; x=1793763524;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VQJFWsO2O0YbolYW05VDBIkhficw7DwnVaUUdw0UKuM=;
        b=mQCznM/RmoBSe0IEtrVCG+3MkFbrXVbBUwR4V6K01ChCgiSJ2HkJyAdBkjOUgy+lO3
         ndzFge/kIgQAovva7pySEBJZ4NOnhjW+cpIpr4sw/Hx/nP8TSjVPmLurjHMr+iFReCj0
         4VjbpNk1AprDO36WFt5eTCNxsg1HkYlfDwL0iCOSRMGzMEGSui9LjqWrdUfuIVnsBg4+
         8eYfvaYEHXYB0TKDU5sjDj+30zL26EVEGLSbAl9v64xNjN/gIKoJEukNZZMArCxpHpw3
         zs1yK237NIPia3IV7BbDMrBm9JhIEHE9c2yQvI6nyc3IqQ6yOdCBeVZOA7s+NN9EW/0M
         y33g==
X-Forwarded-Encrypted: i=1; AKwUvBx+9m+6lcmALX8cMlVYMfSnbC24BmmarAwDSKgf/NTXv/LSCY4JSOAWbtiIf/V8XcuXzj+l66UlLfBdZEFz8PY=@vger.kernel.org
X-Gm-Message-State: AFq9FYKha9yMJynMLnn+ysYcjtqgS3gG6BlWiGesSt5pIZiuo8c6A/Yg
	9Nvy5KnvZE1BnIbtkkRQA8tC+osBpEjracPybkM7ijb5szac4xuJZUP3
X-Gm-Gg: AYBFou0ON+9wG3dQ8eh4g9Bnlm0ZbpcY6Gi0rlAk7DfBjARS1M8EPuaoXjrE4yID5L2
	WxNEe5dIlnc955qJ8JdlwpaCw2iJzAsGIIobt+TnCBbfPN04RqZyrIjNqRsefuTSVpUZNwl+9b9
	k2pIzanPGkWneC8Yl47YQrSa33YWXFYpa14vAeK82g2gUjYrUfrBxMA5gyfzHsiY3Kq6isRI4WL
	xA1hg9lEZZ71bs4YWAjBt0A39j2+gFS5YyoFsyS1KRdEuicBMl65Rdf5d6CyBiUn1f+smi5IH/J
	9gdGHy3rUbwkAoKCVEn8DrcZ3cOwNKTUe/YDV1O56usly9v9zK4G4s6m2U/JT4Lpglu6L8T7BUm
	ETsryr3z39Q853IGegYYcgY7/2t+AQIr1qKt37ZQR88BpYEOspZfRHab/xqByJYp/4iOs8SCzdO
	sR7WUzZOoLBcxJ4yPeQqpevKnYRRUNOsEKH2qHSIVU6rFyR6CvFDC1RYMR5qm3cAq9WbZrKjwHF
	NB2fJQWIwGvVi5iFLoTBVS+Rc7YU3Lg/VSxWJkOtoObEyfhhMFeH4Z3HPqA/ikv1g5XZPLDEVYg
	vIFqArSVr4bM5M7DR51ul0jTNx104MkQgvukZ4G0g3dnrKFYr7PKfH5+FD9HCXdSwzE=
X-Received: by 2002:a17:902:c40e:b0:2e9:8202:5083 with SMTP id d9443c01a7336-2eb0051eb1emr13234255ad.55.1793158723876;
        Tue, 27 Oct 2026 20:38:43 -0700 (PDT)
Received: from smtpclient.apple (v133-18-180-162.vir.kagoya.net. [133.18.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6bdde77sm15882685ad.31.2026.10.27.20.38.37
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 27 Oct 2026 20:38:43 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.100.1.1.12\))
Subject: Re: [PATCH net 2/2] Revert "net: advertise TCP MSS from the
 configured MTU, not the learned PMTU"
From: Esko Mobius <echoowall@gmail.com>
In-Reply-To: <20261027161813.3092f32c@kernel.org>
Date: Wed, 28 Oct 2026 11:38:24 +0800
Cc: netdev@vger.kernel.org,
 Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>,
 Simon Horman <horms@kernel.org>,
 David Ahern <dsahern@kernel.org>,
 Ido Schimmel <idosch@nvidia.com>,
 Jiayuan Chen <jiayuan.chen@linux.dev>,
 Shuah Khan <shuah@kernel.org>,
 Thorsten Leemhuis <regressions@leemhuis.info>,
 regressions@lists.linux.dev,
 linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 stable@vger.kernel.org,
 Eric Dumazet <edumazet@kernel.org>
Content-Transfer-Encoding: 7bit
Message-Id: <D0F0DCA1-9CAB-4BB3-92CF-223C9ECA9BF5@gmail.com>
References: <20261026-advmss-revert-v1-0-272fa4b7ecb6@gmail.com>
 <20261026-advmss-revert-v1-2-272fa4b7ecb6@gmail.com>
 <20261027161813.3092f32c@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
X-Mailer: Apple Mail (2.3901.100.1.1.12)

On Wed, 28 Oct 2026, Jakub Kicinski wrote:
> Is this your real name? We need a real names for code contributions.

Sorry, it is not. My real name is Yongjian Wang. If you can fix it up
when applying, please use this identity as the author and sign-off on
both patches (and in the Reported-by of patch 2):

Signed-off-by: Yongjian Wang <echoowall@gmail.com>

Otherwise I am happy to resend a v2 with the corrected identity.

Thanks,
Yongjian

