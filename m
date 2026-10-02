Received: from mail-pj2-f41.google.com (mail-pj2-f41.google.com [74.125.227.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 550223A8749
	for <linux-kselftest@vger.kernel.org>; Fri,  2 Oct 2026 11:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790941958; cv=none; b=tGnkARfeTxsdHhRQeA4+58hRi1r718SywkRF6wzRe4FLk+7avVCDRXmAvazA9Z7vv7dv3KJjB7rqH6DTAypnvWCNK8Shtl2tOcdCSNSbrlLoGI+jszdYJhnkh1RqgdRf5CARY71P0jLWYWeiTJKS4yveqfthh1HgoUZz5XiRxbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790941958; c=relaxed/simple;
	bh=ZK9W3hsM2fdrVPBcEDof+c76PwgAD673MJ5we/sTLcY=;
	h=Content-Type:Date:Message-Id:To:Cc:Subject:From:In-Reply-To:
	 References:MIME-Version; b=EQG57itjrp1jGcepAC3xLIfkV5NjFrDjCIZEvMP059QVs1qLGbJvW/Ia8uKKXDXnNUnT1A2ll9K2JX6rga/5y5xijH4c0/gYITV4/Z64+vCA8MMeJ0+Mny+4fEqRwAwDv0iK0Pp4ZR2DXfqFVnt24IYPEILVQVF6TJfdFl0VYjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=goUZhIQh; arc=none smtp.client-ip=74.125.227.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="goUZhIQh"
Received: by mail-pj2-f41.google.com with SMTP id d9443c01a7336-2e4bc397f2aso1330325ad.0
        for <linux-kselftest@vger.kernel.org>; Fri, 02 Oct 2026 04:52:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790941957; x=1791546757; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:from
         :subject:cc:to:message-id:date:content-type:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZK9W3hsM2fdrVPBcEDof+c76PwgAD673MJ5we/sTLcY=;
        b=goUZhIQh6T+xmwIT0+JB8OE4Ev2OI+W1B1QvQnPrnbR4slXdPrPelMISBWuSzgq6s6
         2dHWd80pi6Da/Wc1oPU8moB+YkJcefrFFNBlO39OKA0JJW8LnnRgjgh52sbJGZ8FA7Zz
         qBnOwhch0DJOheBhxxTpHc2qMlPLPTBchZNn0TftYojJ70SvDSKxH4yvqWBnRRgcFT3Q
         ibJ8vy9N69AdrrwLYfCrKX6qk8JEBPLy2Ol3Q+xTxZOGeVaBLJs9dcm2pPe0YubjiG10
         oNTQgOQcEQVYORzdIiwZ+Xg5noc5m30zNqOHklur/cGMMFu3Njf5VhoWdxMOS0gkRjQE
         n9og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790941957; x=1791546757;
        h=mime-version:content-transfer-encoding:references:in-reply-to:from
         :subject:cc:to:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZK9W3hsM2fdrVPBcEDof+c76PwgAD673MJ5we/sTLcY=;
        b=uGOYT5yhUp3XahfVQNfcWVsxqV8k4nKps6zzQt5PWoSM87fZOGK9xVIcCXbvNVTTcp
         hzHVirEF8YEhLNxFcXNVx7kVr4goOCXr7pxwoCKp+k3Zwe3502UY+pRAORWGoyo1hvRP
         oMfecAI8wh9yjbTj4CIV+UM1vzDceD+0NEkUbpGOV8GKrfUv1uEy3KR1kikxCax8n6wg
         4zlZ0Mhl6baC7HEF894sLi0CEzA0nDLNDo3t8xEPI1G8/s93k8LLOpmwYjG4uc+OHdnH
         HHTguuVbux/FU8eOJv19k4nUDSyJZS0GIdC3OwhZ/ytKQFqC9WSclHPro8oir5NBvDRu
         16HA==
X-Forwarded-Encrypted: i=1; AKwUvBwNpjjW5CKN2ZT5bzcS0O+59YDK8DkJI37msYNG3X0B+z9UjAdyaXa7JkqGunlHTceaIguPGvDW0jNq46SVpuQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYIQXLmqbubRv9RsOhmNQud1lEHzhLQhLMQaaT9lhTlYIvX7XMNJ
	QxoxZx9vF5l2xWp8mlhR1ZLGR57KIZ/ssuUFS0V7SjDavtpQ6ek2Iq7H
X-Gm-Gg: AYBFou3NxDXxFwoEvWSxIL/6IXV5EJc1b4LrmpclbGbRdVfmQToRGqS3ElMxxYfkQAb
	2Z3XDs/a4zCmGDKN/jEFWc87S5HTNNH1g7Xx/uZhsjQEH8/bkqdeaq5fmz4BJ5SzKmMQOTvoGVI
	/lP1kUUt2EqIxtU4JxkETTDEtkZ3ARMPyobgNKNnQZSCBw3YxM2uUr8V7Yf5kQitvC3iQfrvF+B
	L/pwg0ZK2/N5/UaKDE0TX/Q9+pRtL//Dgepe7KCf9Us2CADU6bNNjGDqdfJFRl6fYf+0nHJcDbN
	Cb2oHEJ+GWyRzpWf0VUZtnryN/B/Fr7SlaikYn60yI+wiKs33fsJf/hKo2WSR9ptIi7AZqRXEiO
	CCAq63tyMh42pkGYr9rpwztbzmwWCwEfYstJ/bC+9XMjRk6lgmIc9y7lkzJYDDQ+fwC5XILH+Lt
	bxjRLrjNWGuDwPyKE4uGDvyxKt5g9pP8wOXisVQf9gLiEVOcFBlPlLTv0rLD+lOVCaQsOy8gXex
	rEHWREaOhs0fgNTil72GKjmqUGOdrcXFDd0Spl3MDX2R2QnslB0rnFrwIvylZM9k9a/ROCrcPCi
	5EA=
X-Received: by 2002:a17:902:f686:b0:2e3:ca8:7860 with SMTP id d9443c01a7336-2e49b6436c6mr22785045ad.22.1790941956649;
        Fri, 02 Oct 2026 04:52:36 -0700 (PDT)
Received: from localhost ([153.61.198.251])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e49f6aea8csm6628535ad.35.2026.10.02.04.52.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Oct 2026 04:52:36 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Fri, 02 Oct 2026 11:52:35 +0000
Message-Id: <DLUBXS5ZYG1R.1NA6CW88YS5TM@gmail.com>
To: "Anil Kaushik" <anilkaushikwireless@gmail.com>, <daniel@iogearbox.net>,
 <davem@davemloft.net>, <kuba@kernel.org>, <hawk@kernel.org>,
 <john.fastabend@gmail.com>, <andrii@kernel.org>, <eddyz87@gmail.com>,
 <memxor@gmail.com>, <shuah@kernel.org>
Cc: <sdf@fomichev.me>, <martin.lau@linux.dev>, <song@kernel.org>,
 <yonghong.song@linux.dev>, <jolsa@kernel.org>, <emil@etsalapatis.com>,
 <ihor.solodrai@linux.dev>, <linux-kernel@vger.kernel.org>,
 <netdev@vger.kernel.org>, <bpf@vger.kernel.org>,
 <linux-kselftest@vger.kernel.org>
Subject: Re: [PATCH bpf-next v3] selftests/bpf: add XDP test for per-flow
 LRU_HASH window updates
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
In-Reply-To: <20261002053837.3494918-1-anilkaushikwireless@gmail.com>
References: <20261002053837.3494918-1-anilkaushikwireless@gmail.com>
X-Mailer: mkdraft (claude review draft; edit before sending)
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, Oct 02, 2026 at 05:38 AM Anil Kaushik <anilkaushikwireless@gmail.com> wrote:
> The LRU_HASH selftests (test_lru_map) exercise BPF_MAP_TYPE_LRU_HASH
> only from the syscall side. There is no coverage of an XDP program
> updating an LRU_HASH map on the data path: inserting an entry with
> BPF_NOEXIST on first sight of a flow, then updating a bounded array
> inside the map value using a runtime (modulo) index.
>
> That pattern is common in XDP flow-tracking programs and stresses two
> things worth testing together: the verifier's bounds checking of a
> value-internal array indexed by a runtime value, and per-flow key
> isolation in an LRU map driven from XDP.

Sorry, don't see the value in this test. LRU is already covered.

pw-bot: cr
