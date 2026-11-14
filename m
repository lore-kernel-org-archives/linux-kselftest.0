Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794681624;
	b=vajXL/UGFX74RMNVjTADxeuWeb57sRVJcIqaBnclcEs/MYZaMfhM6EPxACQDJ1QB3S+B
	 F6DWVptdMYZH7Carj6sPOlBDe7+SvDjv0O/f4xAO1rZTUIkX5JuN3DvShKnUg3HZx7JgE
	 IzuHza1IiPWsvqrlDuu0Wf6F6z11bu3iR+G9/Yv8al2RKoJo6TNJCnoBm8AquBBaqar6b
	 y1NygS93b+usM+527kzsW1Mw0oiWsPMqIwOZUsaMmvPpYJyM6bE9LzBkOlu+brBMcdGBZ
	 SsVPpkeK5esLJISazssta9xO3M9OsTIyJJv4CCNTcJNo0PW8SKECZRlmJzQIT4r/bYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794681624;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:Content-Transfer-Encoding:MIME-Version;
	bh=RDeoDvuqMX5CXuZ8DatSTgljbUzCp6t2qFD5+t+XaFE=;
	b=yijEVlXsnQFKYv78g1jqDGRKuzWTVQSHWPiXbGNqN74TUXNxdKNWdSX8I7l3UB84M5Ou
	 jjV//cuvXseEjmcWlwNW1W3CFyxW4Jr2YKTcT/Mi/rbpSXLu9ZBK28RQqvs9yZa+wVwgd
	 KyhoXqCeTz7kNjvggCL/9xWQuf/cmFdd6K6MY7vuSoOl9LoMIHgOAcdiQ2/LfSpJnIkLr
	 K8Mg/ROTFzlgaF8jwM70pyNCNNAYuXivGS6P3sZ1ELHOS9uafOFjttspRtRMNewyL1m86
	 mfazfKUB9wTSnqwPPq3v/d9EUXJDSJFjJg9/cXejjQnQEHogZ5pzzB/uG8RnMrvOO0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OKQvH0XB;
	arc=none smtp.remote-ip=209.85.210.173
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 943AB606A331
	for <linux-kselftest@vger.kernel.org>; Sat, 14 Nov 2026 18:40:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 943AB606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OKQvH0XB
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-8a06e79e152so1007870b3a.0
        for <linux-kselftest@vger.kernel.org>; Sat, 14 Nov 2026 10:40:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794681623; x=1795286423; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RDeoDvuqMX5CXuZ8DatSTgljbUzCp6t2qFD5+t+XaFE=;
        b=OKQvH0XBu++VojD/u+INoAqGc3Ax0Cm7sYdvZeGr3L8gqCisEOw5EBV3aKep+umVWn
         an/nnKbxKy6DYbjRYvgu/fZ2SPbcgI9KPEl1Trd1mckq3R53F/E6Eaq3wvQbeeuu9l0M
         0r3nMj/ruEGEiipnr4mvv1s9NXN36nHgwxKsBDsYSprDn+XISlJ2s9UsbYlL1fZ36+YW
         A/Qnm1iUNoYEqgY3KOs/GSb9tQtZyGLrV2AnfoR1Y7B/pv/QjEJyAnpnTilMgTc+fpPP
         l+S5oKVA1wky3qlKOje4o9/IM6XIqLEcmeKmB1OmFo+lhyEmEARsV93Mfdv+LzfBQJk1
         QToA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794681623; x=1795286423;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RDeoDvuqMX5CXuZ8DatSTgljbUzCp6t2qFD5+t+XaFE=;
        b=WGg7ZT83cw37mbi52hZQ90LIJUdo11+9oPQ62oPeXZV1Gsg8KszaJw7z2YOje377Wq
         FZQZdRcOy0MgOdoYIopsUtD11sxtETblAihySa6/n0I3x1MrYuyd0t/Z2sVVOI2vE+bK
         MSt+0fKGbvz1XBYr/LxTLI6MMA12Kx6rDFYQ2o+SlXDT3aa7KgVU8DZrQf2jjRkIauXo
         EligUxIlHDYKj8nZ7tPgMkq8dVXRdVR9SzlssIqr3ByyX759HttuxMCXr9ZIRGYaKwIU
         QZc9F1wFFBEBomM2ZTi88VDqrSXIHTVo5aUArtAWOuTwiw0lapE92xCuOfPBmb6ADpcX
         4GcA==
X-Forwarded-Encrypted: i=1; AL+hErHk9rr0iIIIfBqPYVhkZI/OaC/m1bGzFzWh7KpQx1jCcwWuZYnizY/cWgcw70cxjhI5V3u0m+ILa6cxUPfnbLA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+zUlqJ4xSwX8zP/LfPZ4hRxqk9WCK6TXUjXMz4kD11kaXTCkZR
	btEV4FW0/SCZU5l4+fM3sMAcTxUIHRIz0w6s+HgyBrj5ak8sJuumak92
X-Gm-Gg: AYBFou0MkbmPgUeicb/j83QXKkAY/5Ha3nIl86YK9kmVpBbbvSIIzYlSTWo4N9n8p4n
	Jjl94BkpPiThof0Om2cHbJZerKRBwl3vHOHru4Bksjv7qYFkGNJWVYCLTj+OFqC59+6NBxtBfbE
	wyldOUora7QiTw/0lhpouGIkd8eL27wUL+Ce4pNpuCrMn8dBYzow9eWDcOMxBeCop8A2/D7TnzI
	+0nVUlGv/Ig2xZ5ujXY+HF0Mm/rpa7zF9X3g5wjlQEtOeOi69uhwIbKQzd9OrxUudw6v3VjNlg2
	4RU0ykPvoQH4/+OY5ZJBL9/ucs7ng3sA+EdgK01P7Fh2q9EGWvJK7YupaqOChWr8Uts5+LXl1a2
	RsOYqdF8L+EX2RfekVMWDh+P1tDhwG0ED/HunFtFvWf/bjNpU+Lz5wmA+zDZm2ySs3kBR2OT4Jy
	1R1I48rYSUyBaQMQw2hmGF8gGp7YePfUaVgWJCGxpSA3jFRi0VpvCgBlGV59f90f/8RWuMmCzjm
	Q8GSnaY0uFFTxR9a6XX+p9LR7tAiQKSZpZU6OXrxSqeu1lsISubKsgU6dg7BHamN7m7Qrp4JUnJ
	BvBJ6PEZFr8zHk70fL1Ze1E0MUYiDF74uAqDXEQVeYs38s7gO7P8eIMGI6WeV+3VBLhgS6cBUF2
	9WRS5fxXDTnbQl9q53JydkG42BdndBOLzxDI=
X-Received: by 2002:a05:6a00:2346:b0:89f:ed3b:df97 with SMTP id d2e1a72fcca58-8beb7150117mr5498543b3a.51.1794681622656;
        Sat, 14 Nov 2026 10:40:22 -0800 (PST)
Received: from localhost ([153.61.198.245])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bed263649esm2256214b3a.45.2026.11.14.10.40.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Nov 2026 10:40:21 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Sat, 14 Nov 2026 18:40:20 +0000
Message-Id: <DMV5JEF4P0Z8.3K0HQK7SWX2S@gmail.com>
Cc: <davem@davemloft.net>, <edumazet@kernel.org>, <kuba@kernel.org>,
 <pabeni@redhat.com>, <horms@kernel.org>, <andrew+netdev@lunn.ch>,
 <dsahern@kernel.org>, <idosch@nvidia.com>, <ncardwell@google.com>,
 <kuniyu@google.com>, <richardbgobert@gmail.com>, <willemb@google.com>,
 <ecree.xilinx@gmail.com>, <linux-net-drivers@amd.com>, <saeedm@nvidia.com>,
 <tariqt@nvidia.com>, <mbloch@nvidia.com>, <leon@kernel.org>,
 <linux-rdma@vger.kernel.org>, <daniel@iogearbox.net>,
 <john.fastabend@gmail.com>, <sdf@fomichev.me>, <martin.lau@linux.dev>,
 <andrii@kernel.org>, <eddyz87@gmail.com>, <memxor@gmail.com>,
 <song@kernel.org>, <yonghong.song@linux.dev>, <jolsa@kernel.org>,
 <emil@etsalapatis.com>, <ihor.solodrai@linux.dev>, <corbet@lwn.net>,
 <rdunlap@infradead.org>, <skhan@linuxfoundation.org>, <shuah@kernel.org>,
 <bpf@vger.kernel.org>, <linux-doc@vger.kernel.org>,
 <linux-kselftest@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH net v2 0/2] net: keep the TCP fixed-ID flags on the
 header they describe
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Julius Bairaktaris" <julius@bairaktaris.de>, <netdev@vger.kernel.org>
In-Reply-To: <cover.1794139176.git.julius@bairaktaris.de>
References: <cover.1794139176.git.julius@bairaktaris.de>
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Sat, Nov 14, 2026 at 10:27 AM Julius Bairaktaris <julius@bairaktaris.de> wrote:
> Patch 1 lets SKB_GSO_TCP_FIXEDID describe the innermost header again and
> replaces the inner flag with SKB_GSO_TCP_FIXEDID_OUTER, as Alexei
> suggested in review of v1. Patch 2 adds a selftest.

Thx. lgtm.
