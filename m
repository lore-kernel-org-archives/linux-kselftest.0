Received: from mail-pz2-f18.google.com (mail-pz2-f18.google.com [74.125.228.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF414472F67
	for <linux-kselftest@vger.kernel.org>; Thu, 24 Sep 2026 10:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790245392; cv=none; b=tRiPcj2+gascnCmcFvupa5H1ywKxD4yetChYoYWO8BI8+9zrlp9HyPwX8hGUAAn6horLbEO2NyAC02/xNm6s1l3rrQWWqrGzmmawzfyRIPzxueAkMRplxjBQZM72Vz8WVOYGzMfcZLtcnl21UK/JFLJPUwvRz1cgV8HmFj6kkv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790245392; c=relaxed/simple;
	bh=ubDIQFEO1MIByltj3HjP+uhGcS5vNqWz5d++LjyFrRU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JAT02ERosCbz/ERS56ECaKqap8IKUfDyQIdkw+uC8JCQNsYiABFPAfFgSmPYGb6+vKMcLzd+xbd/6JDlRmNTnz5ognEbkWtVbFOmoMcYSUa6jM7nktrg+AGQ8B2RBhfotqLZBr8Rov5h0Ul1bHc/aHks1heh9V13k91dm9GpPfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WgjNqS/V; arc=none smtp.client-ip=74.125.228.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WgjNqS/V"
Received: by mail-pz2-f18.google.com with SMTP id 41be03b00d2f7-cc4bdf8abaaso1351904a12.2
        for <linux-kselftest@vger.kernel.org>; Thu, 24 Sep 2026 03:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790245390; x=1790850190; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wYegx9gEg7NXACHA1V/J0HHo6A6tOLA2/UcguWdtiq0=;
        b=WgjNqS/V+MEVF3oj8o7eohfNXBLvsm9SIWgIUAFwGtISCeh+vAu5YOlHcpt0uO8Gt1
         UGUiz2hw74rIT4dQ1rCfTyu9zI7EvbNWf8R9mQSfysOJlcxoHD4aJ55zj3w/lLWLNwbg
         GD7R2+FZH2NFrr9cvtnRhkIS22i0q/co6tO8mdPyPcoJ4OTklhKLx0Bgu0O0dXFP0mCd
         BRWwYrDb5l7WIwfi97aMUaiGO5gA/+GBNOr3JxaXkdyhcG26G2O1sHBSkLHlosFb0Usw
         fXszAtFF4RIHq3ugoQkKDnT1eTY0Uj0tblUm87fV5uSBEhgBk2h651mWWGF4t33Sd3Up
         1+7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790245390; x=1790850190;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wYegx9gEg7NXACHA1V/J0HHo6A6tOLA2/UcguWdtiq0=;
        b=H506NjDcVg8SGRqU1MOfy1ja+7vgITKcuzhhvLGSQYF/Rtpj2V8grHOJn6CwMxTQJ6
         0yd+ytDFoXnyL6589+qn2NbgYwNNb4YTm4cnVRg+m7EoJmZOF3mrZzLGW7x+TCwljCZ5
         KOHRINtsuaJu2aSarjOXstgXNErxcKpN0YQwRxkYJ/p89O+eAkdCdHnQIhf3nYh+k4Zb
         PJx+RRjZIU1nsTthDqhpxgoh/fk1Ltnh/g5dg5VVzICF9rE4f4xUX/Hxs9bNFdFqxplc
         F8O3sU+fNgABpul/zhn37MPYdfcmAcfCvSMZKqUD9+pSBtjgTUPDg4Cnh17zRvd8KVZh
         Fu4Q==
X-Forwarded-Encrypted: i=1; AKwUvBw7mdWZbE8zxkRB8TyIaxtntwYZ+VnH7Ykz/23DqZOXv080HOOlt4gpvpaUP/n4wk9hAl81pQYtWiufUHjBzoE=@vger.kernel.org
X-Gm-Message-State: AFuF++kosMe4z6doP0IlBo0sgXtBY0cYIqiZh0j4ETC2kkGZRsxPQiIi
	Lljr/tUfx/qiV6d3DaxcWzp+Uyj4qIPPxCwyekJQxFc/az36NW3fFbU=
X-Gm-Gg: AYBFou04MS1jAfkkp8nndZWSCncocr9ZnldK8EKdmCWETGkNSJLp1RRlTUHCay12iWe
	GkZMUDZnTHtcyBSH/9mYuR/wr/46yUARGzA3OQw8aLtHnGwl/lux3VbkenkeGcy9vqaesVHlM3u
	qNbKJQTGU3SANn72tzs1GDMIJ/Qm7jLH7/ZldIc4V+W7+iHb8QTG4orw7TQcuukoKskb56cC966
	yyN6JI1Dwt9nNwdJoDcAGTh2DMa2jOr616pUA55dCuII9iHa0+z5UpN/tQYf71xfI1Iq04MnRAO
	/PDWcrio9T/FEHh5T8TmPtdyxrgfNNZG7+03YtozG/662wCvLprhC6P+o/rNfqFPvwJ99nnrAmu
	YedTKqCg4ERvQ8NamkRwjEDPGlT0QpOEks8xwrEZXaZcVxlJyPpXNdTYnZTYfiCP5w3toV0UQ4K
	Z/c87YHsaon8MAalneH1GpxkcpqRruixiYsXnnFEreHUYOh93xUAi4bQHeW9rFRIlfnIP/D1nra
	TMo0iC18AItE1B1GdJYJEpg
X-Received: by 2002:a05:6a21:9192:b0:3dd:85a8:cb82 with SMTP id adf61e73a8af0-3de0e89f90cmr2113174637.37.1790245389761;
        Thu, 24 Sep 2026 03:23:09 -0700 (PDT)
Received: from ydg-Zenbook-14-UM3406GA ([211.230.25.193])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87d1dadae09sm2668096b3a.38.2026.09.24.03.23.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 03:23:09 -0700 (PDT)
From: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
To: bot+bpf-ci@kernel.org,
	bpf@vger.kernel.org
Cc: Donggeun Yoo <donggeunyoo.kernel@gmail.com>,
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
	leon.hwang@linux.dev,
	martin.lau@kernel.org,
	mason@kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH bpf v2 1/2] bpf: Zero-fill other CPUs when BPF_F_CPU creates a per-cpu hash element
Date: Thu, 24 Sep 2026 19:23:02 +0900
Message-ID: <20260924102302.2120375-1-donggeunyoo.kernel@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <6f3525ba15027c3ab18ea5ad0b081dc086e758aaa9cf8854f8a61021f135fbb8@mail.kernel.org>
References: <20260923000801.1764758-1-donggeunyoo.kernel@gmail.com> <20260923000801.1764758-2-donggeunyoo.kernel@gmail.com> <6f3525ba15027c3ab18ea5ad0b081dc086e758aaa9cf8854f8a61021f135fbb8@mail.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, 23 Sep 2026 00:56:22 +0000 (UTC), bot+bpf-ci@kernel.org wrote:
> This isn't a bug, but could the sentence starting with "Since BPF_F_CPU
> was added..." be split or re-flowed?  The construction mixes two
> sentence frames ("Since ... was added that writes ... so on the create
> path ..."), which makes it harder to parse on a first read.

Yes, reworded in v3.

Thanks,
Donggeun
