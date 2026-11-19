Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795048899;
	b=5i6cC85wi0k/GbbLf3ampVgSca5dIkbk39JEJoWbc+2kuReiFNY4UXpTAMf+W1+iVuVI
	 Qpma/GkookZIafz2Fhfd8jelDrhR3J9YFnvlxHKCddSXtlpUbAsdG3EMku0VC/nJPm8DG
	 Xj1JNclD9o+2ZW3tkMbEkAXD8wDiMYjnGSuBCUYPmfxoSzsxjIRB2FWPDuk/Gxg1GN6qe
	 y1+k8/oNIeX14aUns9Wf5qn1ee0MhF63rs7Nsu37DgjEUozjj+4pbeqvVLDKkjKQruX0C
	 0vEIKRkfD4jLrsK49QzvkdeZJxbhahSmGvlf6JHMtZUm+nZVElAxBZJOLRwZjqgsSBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795048899;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=hvBatQBYMyCCrwFYx6ixL2SoWI3yMG92pdP59Av2nhY=;
	b=pwou9wcCiYPho8Fc667sCYSwW2pY+Lr0bHmKqeWVqk58GEqtTz6yTOlnAx/z+WtDkMJX
	 A8StJQQwzW0gMfuqmkpRWIg0ZhXm2JM7y5TjXxcG3wLcP9z9nZ0tkrKhyA3DnVpXXOwMp
	 UZRUlOwa+PU/iPMq9GTuvS0zNvWhxdmZjrwE/7Pl6bzDrWy4xxvlcbK6ddgJAY8g/WyOd
	 BmmqQffyaN3ckxDbVhPDm1IQ445UVKYhh3iXwk7czXlnA09/Br8tuYg5XrVM9t/GkTTK5
	 UZEq0YX4C96ysGM7m0Fvr57dTGl6Dlee8zZDqexILnqToLnwrmIGArgZH9kC9FXjVVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GOb+xqyL;
	arc=none smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A45DB606A325
	for <linux-kselftest@vger.kernel.org>; Thu, 19 Nov 2026 00:41:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A45DB606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GOb+xqyL
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c505a0acbc1so37955166b.2
        for <linux-kselftest@vger.kernel.org>; Wed, 18 Nov 2026 16:41:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795048897; x=1795653697; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hvBatQBYMyCCrwFYx6ixL2SoWI3yMG92pdP59Av2nhY=;
        b=GOb+xqyLz68ulwX34svmLuibUnhYeJMs1CyRXVUiqptI/WC/pbUF7RIT3eSlVHgdVx
         bboW1nx1d1MzTPJLg8vDngDHQ+uH48Z46LoaHcNovFnEGEFip+CUPxlOzcZERklA2/OL
         nXE/VultkctCKfo21K2EbImQT6/aamY0EuvGAnk6Bjt9YVRE1Aq+v3FJyl+tgbUOB85o
         voyZUA9FKUClvOI9597Kux2e+uN/ghvWdtZTbb8pS7NulrYMpcAtY36GF3Y/ZbfSw3KL
         6rG4gSASL+/We76JNOwN4vn8qlzKOeE3Qu03obXV4OfaOeVrY99ts9oxYJfEJUzdO66a
         LsMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795048897; x=1795653697;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hvBatQBYMyCCrwFYx6ixL2SoWI3yMG92pdP59Av2nhY=;
        b=LAz5EBwUuZqOVqB0fMAt1mSSYQj226md47vf880a0UhenQhN9JRf164VZSuIGjlmDn
         7DUqBeoosw0gX7aUkdBPMy63IWJEtbUbEvM6tI6IdBUTU2xk4rmNVqlhllYWO0GwGnoZ
         KqwuCoSI0/x9celoZdtxj1VTeiVFcZAvzJpvxtRmSQ+Fv17B3d0wDlNrtnDV8DI8ArqJ
         lqVDG4npt5M07AV/wGS4gNcxxyyen7BH42DzWlwwVvIUw01AB1PdBeyR/IXB0rJqAS/s
         HqX3huyZRTCvZ/0XBLh2qmyEC1znbVPkfOUwhB0PzUUo/CPvsZLXfeWxs3ON5JkWbBDM
         iFzQ==
X-Forwarded-Encrypted: i=1; AL+hErGERJUv/FDM5t7YhhMzqg+KYeWDFMpBjXrkGRthOETAQMUD4h5nW/auGcywrJ0SiCLT9qDsK/cpueHz5TWY8+U=@vger.kernel.org
X-Gm-Message-State: APuU4Z86TVjWnhF/UWt7X7Tgl8TptQpHZWZA7/mEkuNvDISjlq9vKAn2
	r/4M3NU7NHZuYvGkR5+oPMwmuXSPCG2Z0Ajey3mEIN5VJME54L8oZoWy
X-Gm-Gg: AYBFou0GvX+2iWcPrj0CZQGEWLXwxeKeg6eNua3WfqRggWsrh0RK8N8x0rDgBZNw1DH
	l6+xR8ZsW+eoNP6Xyc+7wErXscvob3iC3o+nD7dCj8t/dt7P4bsUefh8v+8G7d+mBtF2B9uTKCh
	OtXTUS/60dQUrSU+OFVg2IZ3Rm1gyYSnOo/ICdZaq+BpezJdSzgAwtjnKauHCU/BIQkQ/BAvOBo
	TKMxFFw3+YnsL0iO46RFEbzngy/xXcHeYWXm73SsGb9IzAjQ3j7bon+bhIpbHDcb4AWAcxxis8F
	7f91uLe4cHVrpFPR9BJ/RSrEwcxxhpwwi3/F381eqdAIHxSe2x5JKzmv+iyPNpArYB0hrPvMMJs
	nSUIWCShdP3ESDSdobjKjQKUPznyuoaVfR3X135urAc+spgejyQWiypBUp7BFpHrgzj94cXKskt
	2v248DnIto2g1xecmlu8KAfwgScZges16u3nsM/VP3LSCN+dtfT4Syo8sqpgtboNdq/bPcFCaQd
	JstfKYvjVQgdzVHCL2XKe8wfvbKezVbze6/T3WROJdQ0F66DvbmDB0W8PG3U1OotAh68jBwxRPf
	bTCBNXygztptEZzHskrwoGnCPc4poQwfHPvcHPiP6UhCYz+LuIg=
X-Received: by 2002:a17:906:2a12:b0:c51:269e:5c7b with SMTP id a640c23a62f3a-c51269e6306mr85283766b.4.1795048896973;
        Wed, 18 Nov 2026 16:41:36 -0800 (PST)
Received: from Nuel20.localdomain ([105.118.74.43])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c51234d2159sm52803766b.78.2026.11.18.16.41.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 16:41:36 -0800 (PST)
From: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
To: netdev-bot+sashiko@kernel.org
Cc: kuba@kernel.org,
	tianyi@cloudflare.com,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org,
	davem@davemloft.net,
	edumazet@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	shuah@kernel.org,
	ast@kernel.org,
	daniel@iogearbox.net,
	hawk@kernel.org,
	john.fastabend@gmail.com,
	sdf@fomichev.me,
	skhan@linuxfoundation.org,
	emmaonana18@gmail.com
Subject: Re: [PATCH net v2] selftests: net: veth: propagate channel-check failures to exit status
Date: Thu, 19 Nov 2026 01:40:56 +0100
Message-ID: <20261119004117.41043-1-emmaonana18@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <179486580141.3136.15559598598860423821@kernel.org>
References: <179486580141.3136.15559598598860423821@kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit

On Mon, 16 Nov 2026 21:50:01 +0000 netdev-bot+sashiko wrote:
> - [High] The fix is incomplete.

Legitimate, and already addressed: the three bad-setting checks
gained ret=1 in v3 [2/2] (also spotted by Tianyi during review),
restyled to if/else in v4 [2/2].

> - [Medium] Because chk_channels() now sets ret=1, the "setting
>   invalid channels nr" check at
>   tools/testing/selftests/net/veth.sh:467-468…

Good catch. Fixed by [3/3] in v4,
which attempts max_tx + 1 from the kernel-reported maximum
instead of nproc + 1.

pw-bot: cr
