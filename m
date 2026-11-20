Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795210089;
	b=m2uJeRTr7gl1tPtXXsSMskOCo/12TjrGYLQcX7jZ53UuxxVWrLJQTO0Nkni78kz7kFhT
	 GzjKMRlfHj+6ka7GWZ7jwrqATwCVMvLkCENwxP1QSxaH5Fqa4BgFK0l+WCn3JlZxc0DhF
	 NtqiB/o0IF90qwtU4Hy+nr7HznsyTZcEvkPw6/Wjz5yOSPBBgDQOMdLsYKC8mPgF06wt8
	 L5+9IYj0THWmqEoxh741zE2AatAj3E6rw/m48SH8HSJ+vRRvNViVILYlvuqauAqfGA9Is
	 kGsrQBKGL300DTwLU188yY0i40nsEdL5acmU4H4Bi8QDM8SVoFUtE7pHt3tyZwbXRkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795210089;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=djWeAX1LeVmUiJ144ujbOmLsl/46HHhdv4BSJSqbZfY=;
	b=cYmBF0v06JgFDrFzmtrVfEPmZdT96nweWFZ/azA5qtv1OE/+m0DGOSpd98nRsIrS2h4f
	 2/05n99POjoXW8XW1oEInSQwjm4JP+uIN7anmtst6xpRLwr95o5NPPI3O53maawgCS/Nu
	 E7wg05rg+nfJciAeAStcfFYthTRINic7/NuMyTPCmvcEOKD/DoJIevlZDh7D8ndipt0rl
	 AQaaCWIXto69GiuOK37u3FFIVBiaaAoUNq8KpuWqMW4WqhM0jJr0YRkzn4pvqYHRIOsyz
	 JtbEsCkYhsIG0lFInFm40el0dZob4stMIBXgLydob1R66XtcsRRKiHW3ZNJ3nFsWUpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Be6FxUvP;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C7A1606A6A4
	for <linux-kselftest@vger.kernel.org>; Fri, 20 Nov 2026 21:28:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C7A1606A6A4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Be6FxUvP
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a5348aaba5so1156265e9.0
        for <linux-kselftest@vger.kernel.org>; Fri, 20 Nov 2026 13:28:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795210088; x=1795814888; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=djWeAX1LeVmUiJ144ujbOmLsl/46HHhdv4BSJSqbZfY=;
        b=Be6FxUvPoX7GO9DbG/L1PwSrJb1bWoAgimnvXCLJcHyXTjABEvlZqaXvx0p7gUIGHY
         wgQPSL0IzvwaW2Yg364amqbZH104TuVp0MQoIJ3cTjoQwIKd1bDIIOwmipk1MyPDqAfx
         SRn2cDCCEXNr0Er/UJTovDI+LFVihYGIIVVOeXmB7mAcazV3TNa7SCe1Vg0kPa2Uu+Gw
         xEYMcUg2CWB2tMEo9Cd+j0FmK1JAqhFw//abMJKLYg8E9WV2ToiWZOxE+OShe3tnqPlD
         +GjQn5F/JjU219eLfSfhTeVoQfQTzlhB5BE4wTA+z1Qbjxn7ucIFhashQy2DNtSpDL0G
         5tmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795210088; x=1795814888;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=djWeAX1LeVmUiJ144ujbOmLsl/46HHhdv4BSJSqbZfY=;
        b=hKQB+hagBOclOnijMNLp3RxMOXSRzjxxXWp30RWQ38/ctdQGlGKZCy/REyz+nCttp7
         DZnUPE9YmjzCwAUAoTT4qfPMT6VMEljfAkoiyC3cgVH+C8Of5dcpx5C9KbYPpps4mXJg
         fefkpIYgoJXiW/RkEuAsuNhEjXGDrEqhJqBUQ2Z42GLRaIOyNjCNh+lV2xjg8uZ+44B0
         5jyhaEKJVQXcFalIxUd9J2vwxXu9eOcJHc+zCiY515ijqZhIJPbOi1tqxBl0O9knVY0A
         RzySLBnKTzlJk30BF6mjMg6udmPbZprJ/TFjEJNfEcg/XQhPaoEPS2U5L2m+lkmUciQo
         2w6w==
X-Forwarded-Encrypted: i=1; AL+hErEEaEZJLfd+QNKQKvi+bgUlm5+ACt5XssDcESUHIUs1hU1UmukihUz0sKcxxdwZmQd3d5mfBp8ztEwseUDmWY0=@vger.kernel.org
X-Gm-Message-State: APuU4Z98OuyIPaJLqbzSJE8JXb0L1Gd50wx2R+B5m0vqKOJP045QN0Io
	O0a4gLlCeYTCB4FOMc/+2qbimtgfPsQ97G8riZF6VwvheMFDMQSeunHB
X-Gm-Gg: AZFdTZeKUtSf2rbaUiVA17SW87eomZixPo9Pg5+9+bWXosbkxxE2a0LrxLVX1WE0o/D
	+grpvDc3fhn/r8lgHziIhoU3vO4nza4kyws+d3xQXmf8upoBnXA6kKXj21g9cLLt3xSZpovPUko
	pYeEYazXFTGaECMLMlkE5h4SdA/TtzeXVhy49qRZ1ou8HOe+/c6I3wuV7ycb6AOaMclS1h8HtE9
	2Pw+smHOHBCsD4JDfNS6wIcaUP2fGxZYC6GMkzBuMAZuoBPrvjjoaHAzsa7uQFdprji8iKJQkfE
	buyrxDWdqZ/TyH4iUBoFR3N93CjNUcJdJSRZGMIKmEzru5rXgDxyWl98ORl/JSe9p75mTsk3Jzg
	dl84P2YB1sQjcqRBYmL7L/H5O4TGHYDaMr4j1wa5Sisq5xUzWPmL5cz6UTfY23jGkCJYaNoDR+q
	1sIMF/tHyy2XDjXhWuOwdmK6QMRp/M4ZQhW7/6Ut2IbBNlAYyXcRpePQ5D1loVuSxK5XXBTqSZP
	X8Yar5fiIJlQMp0EKqNzuqdwceAanFA9WVNlO44SzH0lAMfOOOUbMD8vKGwnUwdPnbO9foRRsbT
	MY1/XdzZZTszDFOzyZ4LcrBFp22lM6gbOkbXfZcqXhAEBHR2YABGYyxgKjDdXKxOSN8EQ2+EEWy
	jzZM/jgaHJ7Qzvmm6NYZwjCgIAoe3PRDs1R2tTDlGnBeQkkF8f2Wdchna8DM5AtIWHo2YnMrdpH
	0QnNSufYhOTyo27a0UXBwRvRhgi5ZUJl8EfFcKbAi+uC3lmJU=
X-Received: by 2002:a05:6000:4308:b0:48e:6651:d82b with SMTP id ffacd0b85a97d-4abae12d0acmr10655671f8f.2.1795210087424;
        Fri, 20 Nov 2026 13:28:07 -0800 (PST)
Received: from ?IPV6:2a02:3100:65ed:8fc:216e:bbeb:a7f9:ea1d? (dynamic-2a02-3100-65ed-08fc-216e-bbeb-a7f9-ea1d.310.pool.telefonica.de. [2a02:3100:65ed:8fc:216e:bbeb:a7f9:ea1d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b205443sm7919950f8f.39.2026.11.20.13.28.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 13:28:06 -0800 (PST)
Message-ID: <967fd174-41f5-4ff8-834c-19483dcb342e@gmail.com>
Date: Fri, 20 Nov 2026 22:28:04 +0100
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v10 1/4] net: hsr: keep GRO disabled on HSR/PRP ports
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, andrew+netdev@lunn.ch,
 shuah@kernel.org, kees@kernel.org, petr.wozniak@gmail.com,
 qingfang.deng@linux.dev, fmaurer@redhat.com, luka.gejak@linux.dev,
 bigeasy@linutronix.de, xiaoliang.yang_1@nxp.com, skhawaja@google.com,
 liuhangbin@gmail.com, stable@vger.kernel.org, sdf.kernel@gmail.com,
 lukma@denx.de, fmancera@suse.de, danishanwar@ti.com
References: <20261117141922.20-2-xiexinet@gmail.com>
 <179514132000.3136.2415655157145361596@kernel.org>
Content-Language: en-GB
From: Xin Xie <xiexinet@gmail.com>
Autocrypt: addr=xiexinet@gmail.com; keydata=
 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
 sNySbH3veZ/55EtlXA==
In-Reply-To: <179514132000.3136.2415655157145361596@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20/11/2026 03:22, netdev-bot+sashiko@kernel.org wrote:
> So the SET reply says GRO is wanted but not active. A later
> ETHTOOL_MSG_FEATURES_GET then reads dev->wanted_features in
> features_prepare_data() and shows GRO as not wanted.

This is intended, and the commit message says so: a GRO request on a
member is dropped, not kept pending. While GRO stays off,
ETHTOOL_SFEATURES returns no ETHTOOL_F_WISH and the netlink SET reply
shows the bit as not applied. A later GET reads the stored request,
which no longer has GRO; a SET reply and a GET can already differ in
the same way for a bit outside hw_features.

> Could the request stay in wanted_features, with only the computed
> features masked here?

Masking only the computed features is what v7 did, and it breaks veth,
which adds and deletes its NAPI instances according to wanted_features;
the commit message names the two failures. Changing veth is a separate
matter and not part of this fix.

-- 
Xin
