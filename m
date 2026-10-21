Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792599133;
	b=FnFXN3uv5x8k0kBvsgtnKpyKr2r8z3EKWQ6dN+uHot4abs9fFDFWH/gotNw325rlem9J
	 jKYRFbU40gbQBHNMeVOfe1URt73aIqzCHuFiuleVvSGIoCr5m/uCdo7gxkuHC3/S+cESZ
	 BsrrvSwctr2WokzJNPYJUNOJ0gRKYLew42GuE9eu/DSkM3tUxGNm+GYlgSABkbi7+XLD1
	 KBTb6krqUxJOk+nQhLla1S227F2OAzgR26SezZq1dNTFfBN3pyl8oGIZLd8wZvz+khxL4
	 QW54TwILu78nFM8agt54IiE7+bxAkgdSlcnKKViK82fbOwhQzsBqcdeDwuWgdt2kSIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792599133;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Nv4dga8Beqk0UYUE4xptK3XxJoHuljS/2JzvfnhjtMU=;
	b=xFq8y2gaw8MCH+6CFh9wHziZ2HDQx4AedAk0+boJbJsJ9OOjtQ+V8pM3vfhRX/dGtbpS
	 SaEHFC6dcDnDQpvFVwG6+HKN8d2qD1CbHZlO2hsyrfybxxHJTgSTqbZajlpbO46PXmjPU
	 YMyur6Ww+z9T9RV8j7JRvWZ28dVmvxbjfNjc8fULvfJtaJD2PEXJG9wnnkz706U0SSM8P
	 dRWJbu6KiLQquFE+voN6B/rJMlF5KOH7XlsDFOlf0prcyI0rVE4TRBROe+SQ7Wiks1oFm
	 PpSHuyct609REDy3Uis5VJmvnpjDHdRYwQBCnxUMUHeBH5n4NDTG/RUQG9iI4LkD/2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Et7iQEWD;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1C72606A31E
	for <linux-kselftest@vger.kernel.org>; Wed, 21 Oct 2026 16:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Et7iQEWD
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BF761F000C3
	for <linux-kselftest@vger.kernel.org>; Wed, 21 Oct 2026 16:12:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792599132;
	bh=Nv4dga8Beqk0UYUE4xptK3XxJoHuljS/2JzvfnhjtMU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Et7iQEWDGAKMCS2o9c+29zSscUpl4CwbBKX8IxuAImdtHVYke6AKTJ4Jmc8+DZd4r
	 b5l8l7eJ44H4jVM9hI5Oz26AfSTFROnUPh2PIGm5CaxcPeFsUbExbJGdlkIq3lNO6N
	 k9NpiDRyq0YoGA1nwoUk4u4rRqN9E3Sea5xaTrM4UnAUX+kMx8oBz939fEbwdUxNC2
	 bM8vAN8Rz5rEIqWgmnAIXI20slEs56wv09DKHMVMrZx+4gRZltyOqFa1jo9cSyGc7A
	 /WU7qrG+JtyIbSG94Q2A7voiuFDI579PpwXaxYF5/jiEvuzD7+xKvHNFP0XDflg8wk
	 +b5MbKEcqgBkg==
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-4877837890fso452729fac.2
        for <linux-kselftest@vger.kernel.org>; Wed, 21 Oct 2026 09:12:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwLx/IS25DV3BthSs3yp+BFG6j82xZ2fJR7RG6fGTvFOgOePxkJ6CmuqKkJbu90uguQGpn24wlpvXkYkTWFoSk=@vger.kernel.org
X-Gm-Message-State: AFq9FYIJ9P9po7+6fUinxzSpcsVYYz3tvSHw8o5JO9eC7IFKewcfLCb+
	Ru+hJr/fvYt4O+gO6M31MzV/uFOKkcasutxAw+i5pvhnZ1hcdTr6tZnWJiPs5Nn4KwVnk4CFcO7
	eQPJGW/vkCqdCsyJn7FldO81H9f3MXmE=
X-Received: by 2002:a05:6871:4e86:b0:49e:472c:6b12 with SMTP id
 586e51a60fabf-4a7dc2bb889mr1367699fac.52.1792599131843; Wed, 21 Oct 2026
 09:12:11 -0700 (PDT)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261021152658.2618709-1-gthelen@google.com>
In-Reply-To: <20261021152658.2618709-1-gthelen@google.com>
From: Eric Dumazet <edumazet@kernel.org>
Date: Wed, 21 Oct 2026 18:12:00 +0200
X-Gmail-Original-Message-ID: <CAL4Wiirq6kO+U+zMaKppTTx=4TBT0R4=TPT2qfFuN8U+N0Cz8A@mail.gmail.com>
X-Gm-Features: AclHuK_w2i57ia4yV8d-q-ZdbSEDqvhVGU3hAiIbV2vwLx8691QNitdURm0Db6k
Message-ID: <CAL4Wiirq6kO+U+zMaKppTTx=4TBT0R4=TPT2qfFuN8U+N0Cz8A@mail.gmail.com>
Subject: Re: [PATCH net] selftests/net: tcp_mmap: remove unused -k option and keepflag
To: Greg Thelen <gthelen@google.com>
Cc: "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	Soheil Hassas Yeganeh <soheil@google.com>, netdev@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mer. 21 oct. 2026 =C3=A0 17:27, Greg Thelen <gthelen@google.com> a =C3=
=A9crit :
>
> Commit aacb0c2e524c ("selftests: net: tcp_mmap must use
> TCP_ZEROCOPY_RECEIVE") removed the only read of keepflag in child_thread(=
),
> leaving the file-scope keepflag variable set by the -k option in main() b=
ut
> never read. This triggers a Clang 23 warning:
>
>   tcp_mmap.c:91:12: error: variable 'keepflag' set but not used
>   [-Werror,-Wunused-but-set-global]
>
> Remove the unused keepflag variable and the dead -k getopt option.
>
> Fixes: aacb0c2e524c ("selftests: net: tcp_mmap must use TCP_ZEROCOPY_RECE=
IVE")
> Signed-off-by: Greg Thelen <gthelen@google.com>

Reviewed-by: Eric Dumazet <edumazet@kernel.org>

Thanks!
