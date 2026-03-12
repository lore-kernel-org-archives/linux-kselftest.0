Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AA5D35F16F
	for <linux-kselftest@vger.kernel.org>; Thu, 12 Mar 2026 14:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773325802; cv=none; b=HVzLxWPPvcU3iSgrxTuSvQWnQqT1K5wht+sHpKbGtOgVf+vw3Qk8O8WrsX+r1bCc/2uZ5vr0lElONXxFfPch3e9c6EDZN5LKWeRXI4mwQbPnpxRyWdInjM/gm1jq6e4LTtMJ9qQKkVVWho+v3fm5vKn+psiLgDC75RLWJkkFZQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773325802; c=relaxed/simple;
	bh=UWFL9/AlWB4G82QemscP/h3YWNXqRlJRdDFLB62NK4g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P/wj7U0Hvk91XvX60uB9d+BKKrSG/a8vLNej7JyYL0xPgOO8AGPk6H8H1z0BybjFAoNq/INxYyphxOTibb/P6HOrzbgNfL3EvEHmsr+TsJCfXOr17UtwQAc8PQNtCi9uFbUFqI3kBEDxbRs0twBmibEziyCwCgTqCU8E4czQlQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b=kt1cPIX4; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b="kt1cPIX4"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-439b94a19fdso1081237f8f.0
        for <linux-kselftest@vger.kernel.org>; Thu, 12 Mar 2026 07:29:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1773325797; x=1773930597; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EujO5n+9D3v/kt3E/tW4gqS3T8Dw8WwoBPDrs2+L3Eg=;
        b=kt1cPIX4SQMB3s7vdIw+iPpUjsp3fMEmpWCWkgExSGiljACs3dH/SJEMPuwFTVyT5Y
         QmcjwoYDTsnp0U1t/uc5GiqxTtSymRj1UHH89MIj7QAHXJJhhOH3KEO0Pu91F2b5I/yp
         2Zn2OZiNSS2REBgKuYUmmrgpj49h3LAWb/SmYINg6F2GiI1ijqgww1IQM1v6y6VrBLuJ
         aJ9x/lwL06WR7B+RlG1L80o7MtVM67Nk2sCZIsJGUv7taEF6pWthUs9KYZ03ymFvNgPi
         xZPYN468g4F8vKHGozCDxG4eVhEqgihGfhvQ7bgSmUsMkM3m0aUTPG2lzTDPzQzyy7kH
         Wc5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773325797; x=1773930597;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EujO5n+9D3v/kt3E/tW4gqS3T8Dw8WwoBPDrs2+L3Eg=;
        b=rJ0EEGNq9eNScp5SUVj0xV+1yAwcuUN0fubriTao4RMrXnlXuKvOWsLOLr5NkfUYIZ
         36nYYP7Wjn1ysh0QKMLgrStkZGuknMyYNzxcpfmNAIaR7G3sw07bojp/5pwRVT9f8Ekn
         PlvkuhwhA7CQRAHdz37womMofUmS7UsKLN/9xZETQvH+C11G0TU4Ap8UajV838bKl4Gi
         0eX3U9V2XB1VTcIemrOjPIdHAFTC/W/66KEQiXTKJr5Y3oquWauMYm0wmS/TrdBQXWcM
         MfVsGOD9ltsGuD64TKzTvR+NA+XykQdLrXsC6ewKqBtW+1tLyQKAG+rtM2PkbzxEHifj
         LGjg==
X-Forwarded-Encrypted: i=1; AJvYcCWnH/MiGiPy8oAIj4xkvtGyoFczuv73R7x3H+530dbpkqdYgWt6zzaz8mOuV767BC4F37d/XBGYnBc8RyiRHDc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyFSjWoGREXnC1sxVXV3TyAuRKD0dRX72nYEh9EMy0HViz3nnek
	YniqR1CGCwvKKWY5lu9jdslHCVvtRpOChiK0kNbdxgbS7UXK6rdv+C1M/rKqwMgJoUY=
X-Gm-Gg: ATEYQzwk7FGTDGECYXrLSonAJv185VcQjjIw/a2130vm/XIEaJM8HtdNl8wFIW1RD/M
	CDjagf4VqawSGDw/w42+rIFCe7136bIP7Ok/J/vXH1vBxpQTW2h2ZXSTyOkplXoswQYNWTFwlUo
	gs5NfcgXrE37FVxk2vdTmcv/PsQIYcR9+Gfubufzsm9saCCWDnhIyF9QNFJnLnDcWtko7NVmj+K
	CxqmC/qkmamIi/g3JCo63BCDaM6nSd83LsvdBBKu39Zl3nMkz5MVMqOJxwtsBbDKbwFTwzZo/7Y
	gbwPHoQJAEhghgxMYnp7ojkxup+kb6i5emZVWLtWmW3gf8wptxqNGZ6YoSzIpcl8Y/c9lUKX+7t
	g8M5jaTRsuTTnaqy4UDuUxzTobxUPt8yy1O3GfARc0jJFHQO5D/p2ORmt+d9em9z/c4yBJs/qEs
	dpKY/qBzFAUnjvXT7nAE9c6m87wlyOg90=
X-Received: by 2002:a5d:5f86:0:b0:439:c279:32e9 with SMTP id ffacd0b85a97d-439f8423c4cmr12520707f8f.39.1773325797433;
        Thu, 12 Mar 2026 07:29:57 -0700 (PDT)
Received: from FV6GYCPJ69 ([85.163.81.98])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe1b287dsm8471226f8f.17.2026.03.12.07.29.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 07:29:56 -0700 (PDT)
Date: Thu, 12 Mar 2026 15:29:53 +0100
From: Jiri Pirko <jiri@resnulli.us>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Or Har-Toov <ohartoov@nvidia.com>, Tariq Toukan <tariqt@nvidia.com>, 
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Donald Hunter <donald.hunter@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
	Saeed Mahameed <saeedm@nvidia.com>, Leon Romanovsky <leon@kernel.org>, 
	Mark Bloch <mbloch@nvidia.com>, Shuah Khan <shuah@kernel.org>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-rdma@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Gal Pressman <gal@nvidia.com>, 
	Dragos Tatulea <dtatulea@nvidia.com>, Shay Drory <shayd@nvidia.com>, Jiri Pirko <jiri@nvidia.com>, 
	Moshe Shemesh <moshe@nvidia.com>
Subject: Re: [PATCH net-next V3 00/10] devlink: add per-port resource support
Message-ID: <fw6blzybx7hmvxvqoiy7civmzbf4yuhn2xzdna4apypkuwvck7@xh7iwjt27vi6>
References: <np44uzfn6jea56uht4yq4te5clapgj7pk6ygyvkl22wxumwnvt@nrpvzjqzxenq>
 <20260305063729.7e40775d@kernel.org>
 <ni23r4jiwgc6zjjsubtl4ujjgxzwpxrylumofdwxgozfnieynm@zirlbneaz6p2>
 <20260306120301.0ebe1ab2@kernel.org>
 <74dcd7c5-8a2b-49a7-a23c-174d17a61955@nvidia.com>
 <20260309133341.7e08b35d@kernel.org>
 <5de5103e-e2e4-4b72-9c3c-22847728fbb8@nvidia.com>
 <20260311145126.7dcca532@kernel.org>
 <go5wr5qa7wxe7i4kkcbmecomshpkesr26alq4qmlbpjr72hxgt@mpwq6eufylpn>
 <20260312071916.6b759c3f@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260312071916.6b759c3f@kernel.org>

Thu, Mar 12, 2026 at 03:19:16PM +0100, kuba@kernel.org wrote:
>On Thu, 12 Mar 2026 09:34:52 +0100 Jiri Pirko wrote:
>> >> devlink resource show scope dev
>> >> pci/0000:03:00.0:
>> >> <resource>
>> >> pci/0000:03:00.1:
>> >> <resource>  
>> >
>> >LGTM  
>> 
>> I don't see the benefit of exposing the scope to the user to be honest.
>> I mean, dump would show all, dump with "dev" handle would be used as a
>> selector to dump only things related to "dev". What is the use case of
>> this "scope" granularity?
>
>If we follow the logic that dump should show the user relevant
>resources, no matter which sub-object they are attached to -
>having a dev specified should only filter the objects to match
>the dev, including resources which are on ports of that dev.
>
>IDK if there's a strong use case for allowing the user to set
>scope on CLI but also - I don't see why not?

At least some small sense of consistency with other dumps? Health
reporter and region does not have scope and output mixture of dev-based
and port-based objects. Why to confuse user?


>
>> >> For the do-it command:
>> >> devlink resource show pci/0000:03:00.0
>> >> pci/0000:03:00.0:
>> >> <resource>
>> >> pci/0000:03:00.0/196608:
>> >> <port-resource>
>> >> pci/0000:03:00.0/196609:
>> >> <port-resource>
>> >> 
>> >> devlink resource show pci/0000:03:00.0 scope port
>> >> pci/0000:03:00.0/196608:
>> >> <port-resource>
>> >> pci/0000:03:00.0/196609:
>> >> <port-resource>
>> >> 
>> >> devlink resource show pci/0000:03:00.0  scope dev
>> >> pci/0000:03:00.0:
>> >> <resource>  
>> >
>> >Do we have to touch doit? Maybe we should let doit be what it is now
>> >and consider it legacy going forward? doit which is in fact a filtered
>> >dump is a bit of a mistake in the first place, from Netlink's
>> >perspective.  
>> 
>> I don't think we should. If user wants doit, he is going to specify the
>> object (dev/port). If user is interested only in things related to
>> single device, he should do dump with selector (dev).
>
>Could you confirm that you're agreeing that we should leave doit as is?
>I'm not 100% sure after reading this twice :)

Yes.
