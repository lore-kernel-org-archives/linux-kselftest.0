Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B14433B9920
	for <linux-kselftest@vger.kernel.org>; Mon,  3 Aug 2026 09:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785748209; cv=none; b=tWfp/mHd+0wxYsS/LLNcotb71/uWRd9XQwvCNTv01IjAeWjxsTt367ehs2/oChxBen4xPiyMF3s3kiHtI0054Jjyyp3m3cbA8Onqtpqu3t78t7V0odJ4gAhrnGfmwRHFxj3NDcmLEAuZTK5VkeoOogAnhM2hXOuUvP2z5hyPLv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785748209; c=relaxed/simple;
	bh=y6lUUJwNmJwWDTpMLkBp1YAtLV9LN/nEevAEE/TK01Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IqtZ7AOUlSvxMXrZEp2i6w+1Ty2V8qT0IN0c+Zq44345KgV8noTuW5OyXWHrCsQjYt3nQShYyD9MRJHzWTChj8tJnyIARO/fuhWE+mRnSzIErrvVsmQIK3v/Loy/4nxJSJ44+uPnrHYWB6ypvCMGwXhwhUjhPe/01VRFhuuEpsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=aWMcZFWZ; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="aWMcZFWZ"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-47fe2d179e2so367172f8f.1
        for <linux-kselftest@vger.kernel.org>; Mon, 03 Aug 2026 02:10:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1785748205; x=1786353005; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z1GNJHA/wk3B/tLgEj5BiBlQSmADQEGBijFgHvx9KdQ=;
        b=aWMcZFWZ15JXnt8TWF2uo+PYSu1Q4FwWy0fwoZaGosqKIlt418xFk+VR4t9hDsVAC1
         LqT9/tS86SxoqYGBrA8ABKv89rYQCylPYSfPhPJVItK1RW2zd1IJscbOIsra7EOf1niA
         nuBdYIWug9bzklmwD5xesOxJ2rWvfQMuZlUf8DrwEWCjwlRS3ANQDDsBjzkK2pKDlp15
         p++v35a3BZsBlqfxUuqJsFSZ2I91/gfiZY+rUxGUEpXyI7IgCEEspukuBRHyvsNIFU+n
         f8X5VDjoi/O/ykIdAFiBMJBEaP6Kly5ExCCJK0TsyUcejhB3Xl/870e2IhQOQLFxEPE9
         PnNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785748205; x=1786353005;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z1GNJHA/wk3B/tLgEj5BiBlQSmADQEGBijFgHvx9KdQ=;
        b=IK6LWVj7cuE1scgyvKmNxAm6bUsY+Xe7mq/iyB9+J1tZkwJj5nKTZa63PQucfGJaH6
         ZPCtB9gpj8r7Jx/GHLPa1WCJ1IYvgDgnGHqgxMqpO3KmQ2vWENKvEgF0AuxiQGfzbOqp
         x3E07GMRsWJPwTQMEljvxNnoYAYGO8IlNYydDLuTUmDsTT8n3oG8sEkgC7NBoqHZGCTM
         iZ+b/9jkJPxQANKMhfhDrDgEWdpAjUyJWseAHqQW4wN0cTnJ/2NaJE/AeP8Pct1V/aqW
         t+60BGrV4hRzkzcUMSg/32K7tlY6A2s8AilLxDGw89OFJ5B7QdysMzJvA9FMOrnVcujU
         W+CA==
X-Forwarded-Encrypted: i=1; AHgh+RoOFSD8XMk2e4SMk3hq/vrn458lfpKfIykRkfVbFaFGPJt69xl1wXMuALR+4TTwfOftjhw174hOced9FEjoQdA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxkBM9QYKzV4y5vigoBkImj9NFRQnJcXjfzhgwHuhxfVKzePnrT
	0sk2aSLZOgJpmyZyZtF0UkFQ8K4BvhRRai74AFJw/IC0UCbC6eMa+jHXtHGEepHf/9MhHANNa9D
	0mJrryjI=
X-Gm-Gg: AR+sD13dgWdMDqNn1kJdF8wq1mFi5w3N9+QAswiQgkGerWcEPfiP2Rx8k6dJF57H+ak
	39nPMPL0RSIp912DH4a+A4RX4NmjLV0di5grDTokyGSAHU9sXcRROy4GOWX12BDc+nzTyyNHKlV
	uypHTjfR2m5n26IW9pz9dZdT9UjSAf5hI+DRC7Mum/Zn7kP7LEmBCZ6ENcDif4H98sepGREOfXl
	FtBZ0o/0CBrS77ar8cjrcHcs6GlYbL5IZeb4PdYi5IqH0tKWfrLjfj8d7hXVkJ3rtC1jg1Qt2zA
	qi3XyretakOPbyOqN+GQWESeIdJL7ETUZkcgP44gjl+3d2I5Ao/SOjnd1VQJiZAIsVi89a9yo2E
	A9Ne8RbVBQyB/BJCcfYDBibeA3BNpAypDqeMoG8N+bKmcqq6nam1imWWZjVgOR5W51pvWiL+yFr
	Wt7bZe8rB9btEo+aHWuBhFktGC1sjpFHhmrHAg85gtyxpEEL7ofwgyXMWny4Bw/LXuA1drJcRXa
	klKlxyRdDCdLwUoXWufYtydOQGTxI6VGGe+NISpeLQ4UG5L/h+Xo5stSTYPQDpgEinusBoHy66A
	FipOLpFLpFbwzbfD6RIbJLAjo3/k1PQ=
X-Received: by 2002:a5d:46c1:0:b0:47f:8b9e:f457 with SMTP id ffacd0b85a97d-47fd72b0552mr16078486f8f.17.1785748204889;
        Mon, 03 Aug 2026 02:10:04 -0700 (PDT)
Received: from ?IPV6:2a00:1028:838d:271e:8e3b:4aff:fe4c:a100? (dynamic-2a00-1028-838d-271e-8e3b-4aff-fe4c-a100.ipv6.o2.cz. [2a00:1028:838d:271e:8e3b:4aff:fe4c:a100])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd456a6cbsm28027816f8f.23.2026.08.03.02.10.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Aug 2026 02:10:04 -0700 (PDT)
Message-ID: <e8733203-29e9-4a3f-b41c-198dcf1d5273@suse.com>
Date: Mon, 3 Aug 2026 11:10:02 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 00/10] Fix missing fops.owner in Rust DRM/misc
 abstractions
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Alvin Sun <alvin.sun@linux.dev>
Cc: Miguel Ojeda <ojeda@kernel.org>, rust-for-linux@vger.kernel.org,
 linux-modules@vger.kernel.org, driver-core@lists.linux.dev,
 dri-devel@lists.freedesktop.org, nova-gpu@lists.linux.dev,
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
 linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-pci@vger.kernel.org,
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>,
 Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>,
 Aaron Tomlin <atomlin@atomlin.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Daniel Almeida <daniel.almeida@collabora.com>, Arnd Bergmann
 <arnd@arndb.de>, Brendan Higgins <brendan.higgins@linux.dev>,
 David Gow <david@davidgow.net>, Rae Moar <raemoar63@gmail.com>,
 Breno Leitao <leitao@debian.org>, Jens Axboe <axboe@kernel.dk>,
 Dave Ertman <david.m.ertman@intel.com>, Leon Romanovsky <leon@kernel.org>,
 Igor Korotin <igor.korotin@linux.dev>,
 FUJITA Tomonori <fujita.tomonori@gmail.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 =?UTF-8?Q?Arve_Hj=C3=B8nnev=C3=A5g?= <arve@android.com>,
 Todd Kjos <tkjos@android.com>, Christian Brauner <brauner@kernel.org>,
 Carlos Llamas <cmllamas@google.com>
References: <20260723-fix-fops-owner-v9-0-c1c3af7f7bcb@linux.dev>
 <a9dde63a-5f2d-494b-95dd-7567879de38d@linux.dev>
 <CANiq72kkuKsRAF-r+2OyZbjjgvC+jvqMSXR=LgmqTNRaWQZ-nw@mail.gmail.com>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <CANiq72kkuKsRAF-r+2OyZbjjgvC+jvqMSXR=LgmqTNRaWQZ-nw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 7/31/26 8:29 AM, Miguel Ojeda wrote:
> On Tue, Jul 28, 2026 at 10:39 AM Alvin Sun <alvin.sun@linux.dev> wrote:
>>
>> Back in v3, Gary suggested this series go via the rust tree.
>> Would you be happy with that, or would you prefer a different
>> path? If so, is there anything else needed from my side?
> 
> That is fine with me, but let's see what the modules maintainers think...
> 
> Luis, Petr, Daniel, Sami: what would you like to do? This touches your
> entry, so it would be nice to know what your thoughts are /
> Acked-by's.
Looks good to me. I've replied with Acked-bys for the relevant patches.

-- 
Thanks,
Petr
