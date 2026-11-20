Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795217031;
	b=41CEaFexnHU4lr9xEb+8x7kya8mG5zFVoEv1qGuxNrbv7gx9dwmsjtzERszwcIIOzN/F
	 Qg/TzrnrfPTde6vlqA3P7sIEPl/PWienf2yd6E0QFsNZMS3a1KN5X8/Ykt2RJesZIzpA6
	 smA8ZuB49fZAa7KIf7tGdx3lat8SRB1vz3cZ8nJ413ZWULP4wtXKF8pHLDQaPsbdLUSFD
	 gFjXXZUY/i+698xX7br1LCTE1haywZ/rKiv5rX1I4J3uwgkUxksuJUrG08T3LVGyru+9Q
	 SzcAU5w7hzBBw4z2jzYMMfhK2Dv5wmbSB2zZ19ZmlJO3Kx4kpKvv/+/CMJgA03RxxOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795217031;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=yBWwAFCqhl1MWyd1pGrfSRfgr3arX7wZtYBN4Lqn+rU=;
	b=zmYJIdd/ecWsCFbIk0H9GNzM9iEXtgzx1sdVN6w76AtvbSAtE25hQj8Kew61pDkrPfZ3
	 51tpKdMSJg3Neyc1w8xNK86ZunqoGC7WxZ6kY+S+Xw4JKXOzmrLueSj9Ylf3MBRLsJChG
	 2sV4NoxPgqSkfFvRMaSpvYYmTUnzgt1kPPK4gkTYqckAWfE+nF9j5CzXi+g6WKHXH79Ce
	 IJblwYIlKY0gUnrrOvAqAI5Xzl8xb6kLQL9+zNiW4L1Wpv09jcs8+TcAyN8LDdrW6plVP
	 wlDbYc7QZThO8E20DA+X7wW6kkI07mkhEfG9a8JeYKu6AmpafwlL+WiagaYRYaYjIzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=kernel.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.222.180
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34F9E606A684
	for <linux-kselftest@vger.kernel.org>; Fri, 20 Nov 2026 23:23:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 34F9E606A684
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-949b0d32315so126884285a.1
        for <linux-kselftest@vger.kernel.org>; Fri, 20 Nov 2026 15:23:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795217030; x=1795821830;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yBWwAFCqhl1MWyd1pGrfSRfgr3arX7wZtYBN4Lqn+rU=;
        b=iJ0eYyFBtxXQGX7trcuqIbY0Evu0awRcPcucpStEFFIdjcHhzpM7yasosJrTebVnjP
         4yQkYoiFf0Vxj9bb7xzP+9rtvNsioF4mF2ynno4cf5gq83Vs74DnimVYL5Jeu7b6s3Ph
         YjyyNeWQOGkjuI+yzjwS1jxKpoznhHWcUcIVy2n/LNGhk9Ez2YFc8v6W6lk7Eq1In7xe
         xPNsXh5nF2voE92az+4M/K6zrm1eh+qmjC0B39OPcIBE0omEqpTwYzy5WjYZXh6fSCYj
         G/R6EY7YY/WnrpP7gkIj22DJ06BczpdeuIJsKR1We5pT+IRQpD5bajf/6j+EaBEVWxUD
         jb/g==
X-Forwarded-Encrypted: i=1; AL+hErFH/BcyvALh+1QDouMKaLo7W/tmZyTZ5KmZtwoUqy6+gZTKqvj8a++1fucd/SXWhwommwyr9LzyN0z6VcMpBnM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9OA/zXH0afiiCnXhGl4UvfQBfeX4Sb0fXscz8F3ZtaoyxRDScq
	/RHNzsnduIqgua4V0SaddLebnVoeoY3j8AhlXcFQTYY/fYsu2SscHhOX
X-Gm-Gg: AYBFou2KVpQFfeKb2JBAX/mF/ygnggYLJObDlJKROZdunocqNPvoFWrK1sYnPu22rx8
	M3ZPMx2G5oYP8wDA6JLPrAz5XxSltLxgIO8Dxhg8yn1S2IDzogqjNgDGyzSZJGc65iyMrni1Lln
	+P8MnXqMhYhGhKFiMNvogydEMraBOyfqg2Jt4cPqxurju2AEAdwPQJ0xeNwlDLAqTebq9MsM8/O
	bHRLzFOtofaufI+0Km8Zxd7sVn8DjduWRoB/CdRWYfQ5C4rE154zaW65+8zGtfCz4edZQpCHHC2
	rl1C4ksWVi3iFdSzP+x0vj19JoWpYG1LgaqzM0jFblYrE/4ASwajk2RuYnsATDoExrM8f10ylHZ
	m36U+lTcHnlH8061lGAYQYhMgCIY4aqZOdp5ieIIwo7K2GVp7qgJTKFIqRaJkeP7ZLSIRAICtRg
	qEBUl/aXEzyt4h1x0sfJuWVAjRq+6tdHByJiRR48jVBzmgXlbZOKVtCU5ADxCgzixzbH4UfXoQh
	wQYLsBEuYxCnmpDNjq5p28KRA9sRd7rgflzjUT3VCdj0zL/Ex3ytujAC3VNvPvfKputJlLbWyxN
	ilK2+vgLiTCMw9oaqJJRuqd2tz2QlZ/RIsfgr7Rovpmi2efNWEHbtxhmrPqYZVj137fxQhXfN6X
	gfJxxZjfK1zZfQWqxlK5FZun5tBqF70p8m9ReP/C63bDkk0Dp+5qi
X-Received: by 2002:a05:620a:46a3:b0:949:7069:3fab with SMTP id af79cd13be357-949bab3e9aemr842214185a.83.1795217030196;
        Fri, 20 Nov 2026 15:23:50 -0800 (PST)
Received: from localhost ([199.170.132.196])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb34ac1esm304475985a.15.2026.11.20.15.23.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 15:23:49 -0800 (PST)
From: Tamir Duberstein <tamird@kernel.org>
To: bot+bpf-ci@kernel.org
Cc: ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org, eddyz87@gmail.com, memxor@gmail.com, martin.lau@linux.dev, song@kernel.org, yonghong.song@linux.dev, jolsa@kernel.org, emil@etsalapatis.com, shuah@kernel.org, arighi@nvidia.com, xukuohai@huawei.com, billy@starlabs.sg, void@manifault.com, ihor.solodrai@linux.dev, bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, awerner32@gmail.com, andriin@fb.com, martin.lau@kernel.org, mason@kernel.org
Subject: Re: [PATCH bpf-next v3 4/8] libbpf: ringbuf: Add a caller-owned iterator
Date: Fri, 20 Nov 2026 17:38:22 -0500
Message-ID: <179521430208.33161.12109136474224844730@kernel.org>
In-Reply-To: <879cbd5d4fae85a5ccdb53e5e89ec64f6039e1017b62e548daecbee9bc05e900@mail.kernel.org>
References: <20261120-bpf-ringbuf-fixes-v3-4-ff7ca15d6c37@kernel.org> <879cbd5d4fae85a5ccdb53e5e89ec64f6039e1017b62e548daecbee9bc05e900@mail.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

> Should these three names follow the libbpf naming convention for object
> methods?

Renamed to ring_buffer_iter__new(), __next(), and __destroy() in v4.
