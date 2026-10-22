Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792682612;
	b=HrrxVzwaZ2qBUTj1YqsjCF6k6Hqk/29BIyFBnhnYuo/Ee9q3aOi+071K11YXhh7toNH5
	 WWhI2Ym71KjbUhMvgRUreYp04aPVKQmmr9E/WR7XQYT5HZ96+NLTaK442WCKbWEJH6xMp
	 M6hSj8B3zVEMuthXib9gy3BXygqe98Ae9rWx9edGQT041W1HL+VWwy582602GrRl7PHL5
	 Q/vDxQQukXYbVEKhMi2p0x1/idx11CLyHXhoxFTmSyhfP5BJF7To53nVknPxqLTRjDbSI
	 f9udsZSVc2yVL2vxjRREKFkWJsl0mtD/NLHhlDGyPJKLJGCExKFTo8qEu8Sj73lPV0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792682612;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=0aMMJVhb/yYciWVQAAWCQmERXG+GAY5iNLNs2fW+mSs=;
	b=RyhavAcgRZswSoH3HutdfSboUMLzMN+Pl0OpGVVXkhgF7ONb3GxFWnZZDDkieDF69bne
	 pVLfDMyL+ISyR+8KHuLsS45M7xiDKbRxP+HdNEsjlpkGqG6DXfyWQj2lmDYqA2wAqTahI
	 Bxl7aKJQrqigGo3IIkPP2ITdmOKkW04DxBnjy/VeGevPoVVji0YftaSeS/t6yGv2QRE3S
	 HqqQGJXos6f8LMnSOAvyIXxEWEWan/XhLkEo5eE2GVyg6WoaQKtMvsHimF7ikibH3jMuo
	 xj3Btl/lNjybhd9dW5vjyUsBV4eocJdxp9qH400+ZeCPfYv7WeaCIrmKmY4Dtq42pWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CPcXOyXn;
	arc=none smtp.remote-ip=209.85.222.54
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C121606ACC1
	for <linux-kselftest@vger.kernel.org>; Thu, 22 Oct 2026 15:23:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C121606ACC1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CPcXOyXn
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-98ff53fb739so1124566241.3
        for <linux-kselftest@vger.kernel.org>; Thu, 22 Oct 2026 08:23:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792682611; x=1793287411; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0aMMJVhb/yYciWVQAAWCQmERXG+GAY5iNLNs2fW+mSs=;
        b=CPcXOyXn/DGVCoqRgq5H5e+9MESWF0a85ivXpvn4UAya6/ZGP5UeA1ZnBuGnrLRFFh
         AjTeLjFmwRxHq8yXsgXZifiYpBQt1XUZrwvevsxJOMwGhjf0rH/Whkvpl7ZfhBcqh4FI
         EkqUwAvXou+0EOX5+Tuop/DT8j40mOIbwsI6KjkNrQl2CingR5PPEtNwa93mtpzcyZJ9
         499FvypsmD5CI57ewnqunkmU9A1sURyIxRWlx1OL700rEgMJeqf6u0i3K6eGabqivnsn
         V2Snh5TTHl7hhGWWFhrr5J11zeaZDwHgcDLXJ5k4aVNhhs1YhQ+kbCY2ACAYtEKFeS6u
         9SEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792682611; x=1793287411;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0aMMJVhb/yYciWVQAAWCQmERXG+GAY5iNLNs2fW+mSs=;
        b=LjECJqtBKktzd/cM0Ny/vB8MG7Fl4wLItb1aw5LXyFx6z7KvH9CZDue2dTvMKQvk2e
         rc2/NuH2KzNiJGobv+3RoHnNxYP2tAlyM8iC3NrtU8/lEJ7FTzFlAPOkLf1e4M0vBNqx
         kqyR63npuFfgtiaxEOQOR2kRl8Rft37YjptcT1rNajOhj4AgQ3MYnmMSQao3IXCcUCOt
         kjjZjSb6FTcazeHIV2VssIBJU+tOfX1qs0F3+69qjjEDHO+VrXPOs5XrzZvzUEYUSUKq
         9cngpmkmmrjaqAMr5ys7jGJFYngIBb9I3anpWgnZyuuLvYIKeDcLTRsQj/+DdS2IiWax
         7Bvg==
X-Forwarded-Encrypted: i=1; AKwUvBwBN3dMVJZRa6x44Or9NAK+X+8vUuxwyNauyxYp0dgUHpVrKEHEao+cDQRCZWft1Tbx6Y9bUHmnK/H7EkLubNk=@vger.kernel.org
X-Gm-Message-State: AFq9FYIrH5lnJWVyjF4vOuc8jcsWM8NKs2Uh0tvcvAeniAD0SIu4xvYG
	txYajtPEZWUJvikbfhsFHC/kD+f24kQKXXf5qcGfp+0u/ZzOFv5u5CI2
X-Gm-Gg: AYBFou1WdoD8Q0Ul86sfvctujsceBV7za32cXIxtWQkB08BocssaK5y7iyzLWn/2p5u
	f8rHMlavg9PfemNS8P/H6VQRcjZ7eKMXUj/6u1m124a4tKCYdHJVRKrfGUxgD6qCdtpB/tC12dp
	x8cj2Vo1dgGLvZ86DcfsNuJ8EdYMrx9Inzgnju+HJUnSsteX6n4kEKF3tEPlVSJtvl/z6zq5z+6
	5biW9ayvYitQATB3FqiMB5S8vEng5OkHaNejUL3Zmu3G+wqMunqv558xvPNQ8fdzNN2oAWylM5t
	8ugqUB/xBvy3O0DIM9l+sNCxsjkovmJvTb07pILpq1TG7hIZp2yEfb73iPHtcIXSlndFrADUOSf
	EH9tPvF8H+8uWQX0NsSRhMk8knjI1qQZfnpXHsExyzTFQAawcTrXF4sNa5N+Kz0iQuufUXz11C/
	unJoqtWHdkEqeqjFFjCaIno3V/vXaB4c11jSnvVqTLvElCPbSecUjeBPJNnp1eJ7iNJWb+1JQZC
	28R94/8alB2YmxiWPNhxjqvzxSFqMq/w/BuTi/AZLz4Z7DynuftGdDu82hmVX53th2lkBrpOYWX
	Ki0SWhdz7f8lovqd4tdKtdfE7j1SJDo0JeB7G/PdFPYcG+CkdiONxopp/Wu2r5aGqBTEgxeA6jV
	WLYte+OAdwoEv6KIi1nw=
X-Received: by 2002:a05:6102:290e:b0:7c3:90db:ed50 with SMTP id ada2fe7eead31-7cc9264dd67mr2189802137.17.1792682610974;
        Thu, 22 Oct 2026 08:23:30 -0700 (PDT)
Received: from gmail.com (111.46.245.35.bc.googleusercontent.com. [35.245.46.111])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-990d12049e1sm6759034241.12.2026.10.22.08.23.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 08:23:30 -0700 (PDT)
Date: Thu, 22 Oct 2026 11:23:29 -0400
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: Antoine Tenart <atenart@kernel.org>, 
 Hangbin Liu <hangbin.liu@linux.dev>
Cc: "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, 
 Shuah Khan <shuah@kernel.org>, 
 Willem de Bruijn <willemb@google.com>, 
 netdev@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Hangbin Liu <liuhangbin@kylinos.cn>
Message-ID: <willemdebruijn.kernel.2ed6416f82cae@gmail.com>
In-Reply-To: <atnAmOuzTuL-0f4u@kwain>
References: <20261022-self_unused_var-v1-1-8ab10a6b7f44@kylinos.cn>
 <atnAmOuzTuL-0f4u@kwain>
Subject: Re: [PATCH net] selftests: gro: remove unused variable total_data
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 7bit

Antoine Tenart wrote:
> On Thu, Oct 22, 2026 at 11:09:35AM +0800, Hangbin Liu wrote:
> > From: Hangbin Liu <liuhangbin@kylinos.cn>
> > 
> > I hit a build warning when building the net selftests.
> > 
> >   gro.c: In function 'check_capacity_pkts':                                                                                                                                                                                     gro.c:1249:13: warning: variable 'total_data' set but not used [-Wunused-but-set-variable=]
> >    1249 |         int total_data = 0;
> >         |             ^~~~~~~~~~
> > 
> > Remove the total_data variable, as it is no longer used.
> > 
> > Fixes: d97348474708 ("selftests: drv-net: gro: always wait for FIN in the capacity test")
> > Signed-off-by: Hangbin Liu <liuhangbin@kylinos.cn>
> 
> Reviewed-by: Antoine Tenart <atenart@kernel.org>

Reviewed-by: Willem de Bruijn <willemb@google.com>
