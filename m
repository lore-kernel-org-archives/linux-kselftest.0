Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795878428;
	b=yqnjtO+5vG9zejzV2/0SsktVbTpZAqKsOuOF7dflDm7rtobh0DDXK+8//4VkcYfocwmu
	 F1jcK13Y6u7erRAfaCSiaXjM3julpWPC7Un3Y0ptDr5lH105PDt+sBl3orEfUD3Thdfvu
	 tzZgj5UnZqWYzMAuFUFrOOKEBDp+IncvCvDrEmvXClIkyAo8pBkCIyeIcrgZgKwQswRFV
	 4ezoRxv/4TRZlMJD2zyCo095o1rIuG3VY/9leG2+49DBtaG1I4QYMHHKgo2IBFIyzLvUO
	 xoT3AAxAv1SHmVP/2VKjG+aewLl2uXrJpyNasmR8seRZAq/mkTDQ7pgrYGk1gzjyvLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795878428;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=ClVtae2khtb19o1Dql7h8VoV1Wj0/r3koaDJkVoEQdU=;
	b=bIGvIjYBbrkVngqUxCW6862Qez529TZRVpC1YP6u8p1ImyiTL3zRdKxnPtA1uqhU7t7J
	 xOsshG4Z23LGzM/P0iaCvcpCM6E6aQ1n5veDMUdNRosGYOrVBZoPvkSUbT/psYcndQ0LT
	 YBybkq3XywwIQD7XTlBf921I5ij0SZy3+St8BSJPQguw8Upv1E+wXLKkQJhZQOH6730/Y
	 PHf4IwS1i6B4s+3uG0NDacfWGxA9eOgrxcnMUoM38r/JeWme77lNcoKqxtOtwmXLzKs00
	 VZizKBdWJiD0fdOrlPtno52ogLJzbvqA2sJCKRG8p0kKWg+aEQ+vZn+XWm941H9tCCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=aDiuxX8W;
	arc=none smtp.remote-ip=209.85.218.53
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6F24606A321
	for <linux-kselftest@vger.kernel.org>; Sat, 28 Nov 2026 15:07:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6F24606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=aDiuxX8W
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c5188e4980fso585782166b.2
        for <linux-kselftest@vger.kernel.org>; Sat, 28 Nov 2026 07:07:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795878426; x=1796483226; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ClVtae2khtb19o1Dql7h8VoV1Wj0/r3koaDJkVoEQdU=;
        b=aDiuxX8W2+gteVCIUPG/FgvvNkM7Mmoj0rNnHSgJohxEqQJzvIbLfTx0PT3mHW/Y25
         TGN/ChZmozRhlPn+B7zhaDuFTbXHvKf42CD6eJwr6loO/mR7PdYlwhxM993dIbsHCZBq
         kdwmOqCAmLxRKMLOsaMEio51Dne5WhDXBU4hIKxLXALE0iajF2wAnqTIKZRppecVMIZA
         hk3hpnONDCMiDFfVrV5ikOyIAdz7LZ9HerEyq2PLh2/814ahKeRlAns1VJKX8cJVZtoJ
         pv1RtKe0VPbq46RR18/HFS16DxTZrxjXRXxKz9cqwX2Se56qKRqwk8Bj4kPX14r8cDt1
         LWOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795878426; x=1796483226;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ClVtae2khtb19o1Dql7h8VoV1Wj0/r3koaDJkVoEQdU=;
        b=Nm33CUU5liTJHXkRktQdWm1vmxFS551cJx3pNyxyBXW6yCieiQsMKcN1wxkkfNXTaq
         Dc23kHxZnjbCp4TNCObJCKIgyUvFN6AqRmA26cw8n+g47bJpjo0KpvtfaNsrjN+cBVNB
         JbZNb9/fkcj20W19drTp3DSEgvSbhbx5auQZ0NDPIW2SdsKyz8jnaIyDnUeq92aiCCRc
         WZPxSWyZACzUDoYdqfl7wHvkBPymDn7xRhU2rpMScgLKYlUrxHnJXZBS6QOsqjQxHlt7
         WyAGnlE8H9lRbEKAkvV8wfxVAMGkPllVuBEwaVdMvHlndi3IHuRJBVMtUOcZKnhGQjFR
         DgHQ==
X-Forwarded-Encrypted: i=1; AL+hErE8BBomxRrGB7pSFM1EixiJin+oSsfZnJShB9yqAAyTURrOXYSDb1oZp89yjPYmrF3bQ2piWLpOTLwQKgpDPOg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/AHgaHfTZNHUliSnNBRgG8Jl/gYWzbST/StPYyhXFpkhqi1VXf
	/Xi781lhRsCLugqD2ZOSsEPt4epNGIP5snw76Yow37mt0beLxGMOFItGVfFhQHmOgw==
X-Gm-Gg: AZFdTZfLumO/c4nYsgaS5nLqx6T2l5kLFIx+3TSR9NWVBkLtYs17by/VeQMwfj6WWkU
	0AgWgDAGgGVM4dIksTSVgygeZSL35AaBKpqkNhRytSySFTzgGpRaoBkp5kM1+7wy+uhubDlCtb3
	qkUu6Uw9/IbXJ0+jr9pDBGWImFzmTFASgATKknlK3IxQRmaJSpG1amBGPwL89iIcenjKBfktxiK
	s2CqEqdlmncyTgZF5bu/aV3EmzVf9TcXueL9axSGXGXgDUqIULtdk9bnqdMrCOiEccBGGtG1eOZ
	PGDxqkpf+itqooezhomCocHA3/pT2sSY2x1AnPa4wxPTHF4c42szl/xad3AclSsRrPElPtOYx9w
	IVNWkNzee6mkdRY40CC8KajVgTu9y+FqUpS+WJf+8uNuHm2dI9c6a3TZxiPTvcN6nVrTVHIOXZO
	RrdkMKtUfwCKt/okRDrdek4V3mQq62M4SzPMo3Nqr+7QZ+Wa5KbmeGlsnP6wV2nUfU0VEoGaeX9
	Go3xxHpKjT/22y1vdWTpJmDGOn/2qhvMuWjdKsjYpSqn+j+sJOQ+cgxkHBcNf/akrcEsk9YxNWv
	iYNbJoyEOU6yxPf3/O2uGNCRn5fCtbylkeD/mA/soFuJ2BUecF/EzyulRFyGEvXkxVNcSaApFAs
	EkOkbKgbMrc251esz2K4OxGHqXa1tlPq0qNqDOa9a1gDOeT6QCOGrUZ0bLsusdbna3rmXSrpsin
	wXE1/Vq7sL6TuHEWS4PthhqdQwLfWEuFvanR8gTpiHU5aiqBNhK6Bfan9YUWrtWIdk3Jt4Lqkf6
	6xUxbsqmAW2ZEOxktsA6DAIkZUPySUISdAyUyMxDchmKJZym+oJ9DEpqwMidDQsDkaJ254TgfGg
	iNCrfpEowRmFpw==
X-Received: by 2002:a17:906:f8d2:b0:c50:bf14:8eb1 with SMTP id a640c23a62f3a-c513a84d84emr1751678766b.14.1795878426093;
        Sat, 28 Nov 2026 07:07:06 -0800 (PST)
Received: from Desktop.tail070c67.ts.net ([185.152.145.248])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae8ce16sm965372266b.37.2026.11.28.07.07.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 07:07:05 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: pabeni@redhat.com
Cc: netdev@vger.kernel.org,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	willemb@google.com,
	horms@kernel.org,
	andrew+netdev@lunn.ch,
	dsahern@kernel.org,
	idosch@nvidia.com,
	ncardwell@google.com,
	kuniyu@google.com,
	steffen.klassert@secunet.com,
	herbert@gondor.apana.org.au,
	richardbgobert@gmail.com,
	ecree.xilinx@gmail.com,
	andy.moreton@amd.com,
	alex.austin@amd.com,
	linux-net-drivers@amd.com,
	saeedm@nvidia.com,
	tariqt@nvidia.com,
	mbloch@nvidia.com,
	leon@kernel.org,
	linux-rdma@vger.kernel.org,
	alexei.starovoitov@gmail.com,
	ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	eddyz87@gmail.com,
	memxor@gmail.com,
	martin.lau@linux.dev,
	song@kernel.org,
	yonghong.song@linux.dev,
	jolsa@kernel.org,
	emil@etsalapatis.com,
	ihor.solodrai@linux.dev,
	john.fastabend@gmail.com,
	sdf@fomichev.me,
	izaiahsun@gmail.com,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	shuah@kernel.org,
	bpf@vger.kernel.org,
	ipsec@lists.linux.dev,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v3 2/2] selftests: net: check TCP IP IDs across tunnels after GRO and GSO
Date: Sat, 28 Nov 2026 16:07:08 +0100
Message-ID: <20261128150708.2702219-1-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <e07adc3e-838a-4c46-a56c-eb47bb9e77f4@redhat.com>
References: <cover.1795284858.git.julius@bairaktaris.de> <2f75527eb49d7d4ffec32a61fd7dd080673dc57f.1795284858.git.julius@bairaktaris.de> <e07adc3e-838a-4c46-a56c-eb47bb9e77f4@redhat.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11/26/26 10:51, Paolo Abeni wrote:
> This test is very unstable:
> https://netdev.bots.linux.dev/flakes.html?tn-needle=tcp-fixed

Every failing run reports missing segments; no ID check failed. The
receiver read a plain AF_PACKET socket with the default receive buffer,
and packet_rcv() dropped the frames that no longer fit when a burst
arrived while the receiver was not scheduled. v4 reads a PACKET_RX_RING
with room for all frames of a case and fails the case if the socket
drops a frame:
https://lore.kernel.org/netdev/cover.1795869698.git.julius@bairaktaris.de/

pw-bot: cr

Julius
