Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2786827603F
	for <linux-kselftest@vger.kernel.org>; Sat, 13 Jun 2026 17:53:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781373228; cv=pass; b=rEHiTDTwazO1Ffw4dw0W7QrGBtDyOp1g8CfKjLQvyaIA16H4ABK+zx25xivDh3f+aiRcaHLvSu14XCGUtJKNISw4/XdfH4AZIR4WZQ6ed/n6a82l7qp1Rx7MlDM39awuf5d/jEQo5E+YHbyJDbw15alqg93DCktmDNbdv2kdcQM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781373228; c=relaxed/simple;
	bh=cHOHNOyUyYBfHV0o1Nf3hriSXuDIGz3neaaapYBjf38=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qr5Z2ksTNcy3WEg/+6DdL/lXeTK7nbWExQey/XVt7S3VGKFdlsfn+/7XXgJbgEy/UcoUN+VyQZji+Puv2GUXVzZ2wkeudxxpeI1OBJhHJ0paMJV8vmDh3AlgXYUTF09s+oANdmsuJSiq7SIDna0bHpB/pAITw20jhCq1PW06ank=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OexkXffG; arc=pass smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OexkXffG"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2c0c1e0d00bso18297415ad.0
        for <linux-kselftest@vger.kernel.org>; Sat, 13 Jun 2026 10:53:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781373226; cv=none;
        d=google.com; s=arc-20240605;
        b=j5iBaOH+LnOBcKaGOKKI5+tBUTC1ccT9/Jn1m2XcVKu6vMVhXGZRpKDrJK+adizHHf
         JsslDqX0X2NdW1z3QKR/m3/wrhYLqu1CPdk94xPUGMeces3iIRX2OFDZQkM5qlxCqrfm
         MTVUqoiDngVky7yags5OdZ+pRdJO2/490/a1+kcd9tyslWZ5wTI0/nB1WlAQm8h0KLgB
         LOg/ca5ORKog65chwFeKyHxodSbQ75Mj1XTrFqPx80duMqhpmIRwBSkmLmqV++J8lRyg
         l41hCqOOhxWESDMGZ6SJGwKm5RwJrtenuUA0ZDGfaKp248fKfIFtIg0QSDsDRx7HiNEG
         qyUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cHOHNOyUyYBfHV0o1Nf3hriSXuDIGz3neaaapYBjf38=;
        fh=EoeSqD0/gKYyQKpFcfHY1r2qfOQ8hwCF5Klf8c6MoT4=;
        b=eHXFLq9dCgizzqHWNZnmWH1VJCIZi7b1o1zXeQzCQXhWJj9f/dYKfGo2d5SMB5Nu+V
         aqtYHvprQk5OjrV74M9Ba18cE6jQQJ29iH3duTCMSxOaaM/ElLWpmiYJS6UFtwVYZXyI
         wGfrR10qrKsraqL9M6C62GnN+Zi+2Y7oJMfv7THOcs+RmKJEykBMytDL/WVG4nI06Cba
         qwauBqOybZZNop+Q2LF2/XlAcKWN9pCPbGlyHGQF6tCWv7eZP3mVX5tfUfaTO1KYzGmS
         5t0t1IquaYB2VkrrvkiiveWdaXxooKMZWB0S482IVz6FoqKjVsiHq+epokrAIHxWN5Ol
         5U2g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781373226; x=1781978026; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cHOHNOyUyYBfHV0o1Nf3hriSXuDIGz3neaaapYBjf38=;
        b=OexkXffGeEZa7FMR2Kr9By6VvGTV4HKf7rbZtOaIBuiQqRxP8BqdeFsTAhUYuMDuyV
         wI/Kc9ATBTeWgAqZgvV1dTK32g4Mk8zCJlvW7Q2eTtp4ZOC6PnxBNu1U+XRdXRS8krRq
         19i2wpqsPNlOIMaCXmpmTg7pEnj/v2O3gdpv2q/gMy66OJ5BABTDJFDfNob085tqYtZO
         TFqk/WZRYI7DfWe3tibOPNcjqmqnLkm20pzui/k+w4VOAFVMMsxKwXp1xQMQX8kMsxed
         nLa+0BtxQdKLCkuoQcd8x3wuM02EFZkkfSoWL6UAcdQkiazCIi55W91zx0Y72DoAY4s6
         iFCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781373226; x=1781978026;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cHOHNOyUyYBfHV0o1Nf3hriSXuDIGz3neaaapYBjf38=;
        b=aQXRRnVj91STtWjgp8kcowWPrv8M9ooymvpY2V/LlWfNWWX3BA489VuJtcS3usJkIo
         44SipJDKobW5F2JdAQFGa3d9dB+z/BioLDa/u6jcs62mmgo7a+EJceosZHZb6aLLBvkV
         RfCu5i7oK6Pll/WKfGJN/CuMtoLzm82hbBfzu8vBkaau/QAYbbQTXko8U8RlZKpkgem3
         mYC9CHcOieudNAiDDc8zpZr8o6ApsGWu6O5i2mv95nAeV4Le3NhyAjtGIPNevgYLIYv4
         N6tLHFsC31LMD79K1/rSg8HHbRVBTUywEwCaJx01XVzgPdr3QseJzS9Fr9OLZJRW4oWr
         0WmA==
X-Forwarded-Encrypted: i=1; AFNElJ901nt337gxu5nj0pK5EJfaH+MyHIA/86k5FcipEddETueZaIPT+TDPuSa7WanimQ/SFU4V39k0+FaJNpJ9uHU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwzAQa8/RdA0EZDz6kXJQkTTtnfHPzJV1oGVZLsPLi4v2OHvUEt
	88Va/uergrvq13L2VCYmlPy0XsdBo5/AGXdVLfoTQMh9BOj7JW1F70w5c1xlnu6CbIOr5EZuHTy
	hbYKC3s8+cAuFrpsLV+lcRaKKmmx11GQ=
X-Gm-Gg: Acq92OHdzHMWl3oN1gIq54v/gh7qh4CMSGuyfQ3Tfn07YEnJmZSsJ3glA7HZH4fjgvl
	fqwtGE9ckpFrK0WdOMZrgydsRZHSKtKduF2KXYVgwcX0fhqNylBVh5VLBY1xxzWmDnoqFyfEeEH
	jKZvWg9ekc0vg7kpesb6Ded/SAIRiV+zUJe9emd0FUvuK6LxlD2iVsAK84io6N9iv/GZtmLpT7H
	Ly2m1dRza3EwMjIZontt1urQcHrP3kHHhkw3jKaDGUuoDQxEwNFglwGjfTJbsdVWRp7H2/Lkazm
	iczlWZN2Ibgu8ZLDklPlnwU5ypDjVA2RWGBUYNqvUzAyUsjdUe9/I64gY1LJbP2qraTHBF9XAdX
	3dGVzxY7Eol9jzlAu8ZJXliJgTEEpk3UreI0=
X-Received: by 2002:a05:6a21:487:b0:3b4:b2d7:c146 with SMTP id
 adf61e73a8af0-3b7840eb437mr8380305637.21.1781373226415; Sat, 13 Jun 2026
 10:53:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260612114032.244616-1-sun.jian.kdev@gmail.com>
 <20260612114032.244616-2-sun.jian.kdev@gmail.com> <20260613102549.0061a875@kernel.org>
In-Reply-To: <20260613102549.0061a875@kernel.org>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Sat, 13 Jun 2026 10:53:35 -0700
X-Gm-Features: AVVi8Cf92xxqHllCzGcs1Wzm4G1Syt1-QC_TVzr88S1xZSnhQVts2Q0JSSNR-Ec
Message-ID: <CAADnVQJyOR0hppTmhbTRS8Sp5ci-L0fmQ6V+R9eiJDop_95rVA@mail.gmail.com>
Subject: Re: [PATCH bpf v5 1/2] bpf: Run generic devmap egress prog on private skb
To: Jakub Kicinski <kuba@kernel.org>
Cc: Sun Jian <sun.jian.kdev@gmail.com>, bpf <bpf@vger.kernel.org>, 
	Network Development <netdev@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, "David S. Miller" <davem@davemloft.net>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, John Fastabend <john.fastabend@gmail.com>, 
	Stanislav Fomichev <sdf@fomichev.me>, Shuah Khan <shuah@kernel.org>, 
	Jiayuan Chen <jiayuan.chen@linux.dev>, =?UTF-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu?= <toke@redhat.com>, 
	Menglong Dong <menglong.dong@linux.dev>, Emil Tsalapatis <emil@etsalapatis.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 13, 2026 at 10:25=E2=80=AFAM Jakub Kicinski <kuba@kernel.org> w=
rote:
>
> On Fri, 12 Jun 2026 19:40:31 +0800 Sun Jian wrote:
> > Suggested-by: Jakub Kicinski <kuba@kernel.org>
>
> I did not suggest this

ohh. I didn't follow discussion closely.
Do you want me to revert the whole set or just remove that line?
