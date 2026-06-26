Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 233FB78F2B
	for <linux-kselftest@vger.kernel.org>; Fri, 26 Jun 2026 20:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782506887; cv=pass; b=bjyvqEsu6wmNomW7QVv5J8ByL8n7oqI2RLW0P13eGow4b+CqrCHQFPT0ylK8tHG9nvnm/4HL/w372BX2G+rD96J/ico8mmxLJgRr1uoh7q0S0fxuqdsCdhCis99YzZ4aDaA9bY2fQTJCNNQXFUCHZ98SDNetvutDFoay376/l8I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782506887; c=relaxed/simple;
	bh=KElP/Iy1UeyW/Da0/mMf8Kynq8HSdLhoCnepn/8wCxU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mT/+KtR9/H/xxrFeptR0MNIOOhK2pVVopp/qfBF+8o1Dqulyx2LrZoyqVxxrKPwifOnvOwOU35jsCubWpsgm+RSxrlpkJ6i1JQ+TX8RbNs0SOydDxwml5/mTn6o4TlRZmHuPKb9HGX7pAyLoYFjBAXAqYJTWEOkIz9nrJysMi8E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qaaMTerd; arc=pass smtp.client-ip=74.125.82.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qaaMTerd"
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-13981833e13so1829910c88.1
        for <linux-kselftest@vger.kernel.org>; Fri, 26 Jun 2026 13:48:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782506885; cv=none;
        d=google.com; s=arc-20260327;
        b=Hc1ld0U5C0yzVcVzhxcWf8AAovIp53dyg0tfatpMnqj1UIPWU3tYMr4QYR4nvjG5Nx
         P3lAr+OKVnJMBMsplJWVFZMdPo9C0dk1PVebXg7CMg8Fb8qkIGaSB6pDMm+Z0df7C3Mn
         LpuZl3/rq3k8rp6Wjk6iBFaYBjEdiJn3Fm04/SpYPWx4UJqcfwisshxtNUYK2IKU9/OU
         jd7oYQ97UuqKE2VRE+AamxaO+rEQSi0/s1CbSe9uTmMhE+6oDBgCO216nFRSuEL8msXa
         Vp/xqeC2/Cc54Br1ErV69RefedXrabtTjozAyL57NMS58YVRGw3hTE8vhl+8cNJeIaoE
         wdcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KElP/Iy1UeyW/Da0/mMf8Kynq8HSdLhoCnepn/8wCxU=;
        fh=/kLAZ2CQHX5SKcSVoPpu8TnfdWtLyBt0cG7+bv1wUFA=;
        b=cTZxpKxq+6VPDf0teuXYUKOETsIi2Ky4KcZjN5QzFgSV8cC6WF0MFQ840+SJfJrcll
         pMDZColRNCXiSw3YOD5BFHcmUlL2zTfOCW3LRPiTc6TPRmNxfLCs1GqXIYnqst1mq1bz
         Q3wm1iGcaVrs3RdDyCdcfDAI2TSJbB2BGIxec/aow0m1USJQb//XdZkxs6OkvccEchng
         IZf3Wd9D+kegPWyMjDHjkwMD9fxJ/vV2jv8pXLjHgS6R7QcGr5kkqAhq6gqCrVPV5Y7z
         /8XHyZW12R4DasiyzXoGE7Apq/Fy2LySrZUy+tAAcE2NL5W/Pbr5iNxd8RzRwMHmQ0Pr
         kqxw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782506885; x=1783111685; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KElP/Iy1UeyW/Da0/mMf8Kynq8HSdLhoCnepn/8wCxU=;
        b=qaaMTerdITfOXCEd0UTm4HJevvw/vs9CVVrNrzoqqKFBKsdWib1Iy5rGO1FJlCCBQ/
         f8ifRfrwrIWkHT3czl94uwHrch/1TChpngDeOQ7Z5d2JCZw2rBr0cN5OORxNrr211ucJ
         5iY/suWLSuQ7aKZQjtH2Dtrd7fvUaIIkZmLq6rXd0fcghA+rtzlkqF50mIDyW6hAqkd4
         +l2feFlUgYSUB8aWc3yeMD9wnesjOKc1BH2lb8nr+awjEAu0taUJIKg/kD0edNd9M7sC
         2lmaFrkSC5F8Y7/T8dgkwsrvH86ozYy1Qv0y+Fd2rWYs7VmabYYbrzvQS2+scDa/yhQs
         Yh1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782506885; x=1783111685;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KElP/Iy1UeyW/Da0/mMf8Kynq8HSdLhoCnepn/8wCxU=;
        b=QLl+V5CmQN/awlopkjH3lt6QbgdOHWVrVNTEuKb9HaU8FGEPAwhizSOiyRB6uVQVhO
         /1Bhc+5dmA7C/0Fr+haXBlOwJ4wOyM5Oaz17bgViiGCuNkqJ1IuP9DxiFlqTZQmG7hte
         ZfposjqPvg4n/Ib6a9pEEEVGesCV3Y7wEtBmd2qXKnG5PXePJwsxSZp9YD2w8V8v4d+a
         68Q6JQbZ2TXtBR6pG/afaDzKUVbJnT8t3kd54Yx/GIBhAK/KP4N1+RLQ0Ko35do4Pmrn
         Vy3E1xWFih2+u2p8JJ8s8QNZgO2yY1u9JmXy4LWiCocbug5n8/yQVkpkuLBisDmv4/Ox
         zgYw==
X-Forwarded-Encrypted: i=1; AFNElJ/b7z/IqXlluh7saYYXWpMaYXURc34TPfsGA7QFYI6KEszfb2QhcJUq2KV7z+AVOFOvO8e6nZIh+bk4PAQ4U3A=@vger.kernel.org
X-Gm-Message-State: AOJu0YzW4uZajH+RV99vA9fgxoZfmZtOzyd3bXvQ1V1ZatMzrKlKQsl6
	RgUW/xUSpbNhPv3GRHCabLdC42X4Jy1FT0tap/usWbDWLn2MEuRoVccCdzi9A/7ICz54w52fbgD
	tl+DxvbERImlSWFRIFpVxZaxAu4LM0VWjLlP9c2Jd
X-Gm-Gg: AfdE7cmzu2kY15sGeQb7oUjfW18LW1jkxRJ8+LIBRGLf4tMRvK+UEXUoIzvUv/fPwr6
	NEKAEKyjEbOd+quUM+h6eYejAHhLJ3zo3BnFBLy/mFxDelbzgDmHWjMXGc2dr+7OGiFrU8OOIrS
	GNPTrNdz/IoSQvxQUV/2FBUvnDou0+HPnldvZe8CTYkOCopQacNhdDeIZvXUm9iu2vC+nDBiMN8
	um7OxGncBl4KwDbDnZiLscCMUUkMqKgLi4OTglCkQzDFOps1rS7w6vEXQ2mDpMQVXNztcKfkLHo
	V3+HPpJdvVL88YrT/sdXUpXuYnQao9Mh7i3RF3f/0PFnRfdExwPmQWcDlWN20qm+404zudnKfU6
	O5pI6uZYqNrNivIbESSzcW1Z2htIMrTTqo9XDUHQ=
X-Received: by 2002:a05:7022:5f14:b0:139:ed5d:7568 with SMTP id
 a92af1059eb24-139ed5d95c3mr689594c88.47.1782506884557; Fri, 26 Jun 2026
 13:48:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260626-sockmap-lookup-udp-leak-v2-0-7e7e201c951a@rbox.co> <20260626-sockmap-lookup-udp-leak-v2-2-7e7e201c951a@rbox.co>
In-Reply-To: <20260626-sockmap-lookup-udp-leak-v2-2-7e7e201c951a@rbox.co>
From: Kuniyuki Iwashima <kuniyu@google.com>
Date: Fri, 26 Jun 2026 13:47:51 -0700
X-Gm-Features: AVVi8CejzJHp_vEaY_FIRiYnk19hwrxgeyua0I2We0gP1Ictf7xHIFKUIkMHCdQ
Message-ID: <CAAVpQUCGpSWuei+cX9LL1WG=-14_FJU75G2njvvWCugsSMWDqQ@mail.gmail.com>
Subject: Re: [PATCH bpf v2 2/4] selftests/bpf: Ensure UDP sockets are bound
To: Michal Luczaj <mhal@rbox.co>
Cc: Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, 
	Willem de Bruijn <willemb@google.com>, John Fastabend <john.fastabend@gmail.com>, 
	Jakub Sitnicki <jakub@cloudflare.com>, Jiayuan Chen <jiayuan.chen@linux.dev>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Simon Horman <horms@kernel.org>, 
	Alexei Starovoitov <ast@kernel.org>, Cong Wang <cong.wang@bytedance.com>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Shuah Khan <shuah@kernel.org>, netdev@vger.kernel.org, 
	bpf@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 26, 2026 at 1:37=E2=80=AFPM Michal Luczaj <mhal@rbox.co> wrote:
>
> Update sockmap_basic tests to bind sockets before they are used. This
> accommodates the recent change in sockmap that rejects unbound UDP socket=
s.
>
> Signed-off-by: Michal Luczaj <mhal@rbox.co>

nit: this should be patch 1.

Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>
