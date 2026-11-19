Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795050671;
	b=Nhh0/c0wKMD4AXhgwnDksozMo1jxBpJP+apEgTQt7j4Y0RaX9DDz920koIApVUJT1eRx
	 uOFs4V22ezcA2fdep8ZJmRMZxxXl9Wpyj0owhClJUVcpNpORZmdkOWYRqbuEbRAdisODE
	 GFqeccgKyPQjtvE6/+8qW+n/+749zjUTjcrLSl/v4wz+Th10ou8GWKcfnpp45SoLZL66W
	 iMJnGFhoMuv7vZkmQAezpIBewa1VNspSBd4KTWOoOJ1yE+O2fvBleNfxqWcLQ7f4n67Tp
	 u3+HyZunb2CPNXGF8ynJfnkFflJeEPumM/IrE3Tks2lOcM29cHEg7gS6nwLPeCmfcOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795050671;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:To:Cc:Subject:From:In-Reply-To:
	 References:Content-Transfer-Encoding:MIME-Version;
	bh=pSkuji4kXwZcd1ydna+oHa+tnDhj558qTFgbXnb/qHI=;
	b=RIpXU9LWCmVX/H8+fDDFF4vdXdck+B6klpe0H7LomH7gZegt+4FpYy0WDnMNavp3liqj
	 +3yvYafPAF9R9mU2WTD86lYrVD4YC1v+kvsI0tTr1PAcKLAxzdBrueivZJrh5tlwock/O
	 oaHJQ3EVExBxbgUKAA+xO7klcd9k94x8QkIRDzRDA+8Iq0S1/KPCYgLPnNNVBG/BIcCxs
	 nV9hIpTWFOQLDDX0UtHKXi/w6rxT+acFqk15CGA07ezZZHS3+9GFtaV8k93GwMTTsmpP8
	 K23P6VIG/eXwy7gG90rvrlugPdsMplVDjtUkV+aP9AFN8zfadNJYGGe1inNxZu4t80A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AQxjWr92;
	arc=none smtp.remote-ip=209.85.216.48
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96FEA606A330
	for <linux-kselftest@vger.kernel.org>; Thu, 19 Nov 2026 01:11:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96FEA606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AQxjWr92
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3ad41b47541so1283513a91.1
        for <linux-kselftest@vger.kernel.org>; Wed, 18 Nov 2026 17:11:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795050670; x=1795655470; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:from
         :subject:cc:to:message-id:date:content-type:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pSkuji4kXwZcd1ydna+oHa+tnDhj558qTFgbXnb/qHI=;
        b=AQxjWr92FxP60mndSKV1WTxMvlLowBCe4ISf1KUb5lLrWmFDGKOqW+rvkah8HZubyT
         xmx6n2ONUy5IOJNNxTrL91ftGOtwfB1sWkrm06UxgLyrLdHYWG7i/evZhXDs2j3wm0S4
         L2/kS8SMInAdFLQOYw5m219eN9iMe/ALzLEZRZ9mzRti9mbEFfMj/hrQMBFR1eoy2op/
         D5A80+nsjMEDab9wzjTy3BhVjDZbyxNs1wEgLVlN83T+ngwRY+FNpSe8bl/PdZFGHWB9
         RqCy4BfRqoZJemQ0BRqZAmRaWIvwTnzgWA24Cs1qZkIfMyvmnUeYw50P0z2oABLVlTwy
         ZvXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795050670; x=1795655470;
        h=mime-version:content-transfer-encoding:references:in-reply-to:from
         :subject:cc:to:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pSkuji4kXwZcd1ydna+oHa+tnDhj558qTFgbXnb/qHI=;
        b=ByN4Hu/1tuJ4Mbs5Bs18ZlIJKHkHRZTqCws+o03MwJoh41fjJqQRdOn56OzD+nNduT
         AKP4DVus1J/+JwVvG37gkAkn1p1rC7mL2bxzsfNASUW3WicwN3BesMnZe2wQ28Q487Rm
         lj+/5YXQcYbTZq2PeB0ny/eg7GFR89eMeCTZxP0VCyXuMylyHdd6ouClBe0ALqLDls1w
         wIyLH0FNsUEZrIVr7UoNqFaYOTQnY0/q6pBm6JbvkhsUQosd++U2BMKCGXIymTPwx+9q
         rxSRJNu8UUnmVP2abXpKbOb7AQCV9Sck3PAX0iNfPCrY2e9zNRX4qQ/S1hGaH3NTN4Bj
         tsWg==
X-Forwarded-Encrypted: i=1; AL+hErGz74x7PblAh1vQMmDnUjV/rVX0hj6Yw/hQvAGEhnRb/M7gLn6IONhGdPKqn8RJZp4kolRFgbCsyTdUWClXV6g=@vger.kernel.org
X-Gm-Message-State: APuU4Z832u0HXMywt27Ba3cYyU5sPCS7ISK7lzt5qVecD3BUPndvCmPh
	8O40gNU6YmN1V/uh0qL+2n3GdRg+Umlsg04ZWkfiUWadMoWjb8wy8v8K
X-Gm-Gg: AZFdTZcmb3hyb4nQWdk3ZiecMz2gkQUSAHyoDzxzXAv3xUyZ6nompy2Xdma6AmNU3fk
	pErSMHVEbQ9+i+vN31zJ70gD4iRzZpMIgtlzD/Q1PwIOBbW3rw3BOWbNZxXceDYDr3yDHkAStmb
	/aBufLIXjWoJoykxA3Ui8FNRRjDMMrJUh/bxUox8KdX2nr59KKTSmLmsjmebSaDa8Lp6J00jTBz
	QaxW0y0iGCkF8p1n6JUaNxTObiKbDnHFNUaYIueomj3jJFT4lw2CNcUobjoV8mqo3ytvv/V+FBW
	9rroD7IURkaDnpQaYpuWbizSSqHlcWdZLvdsNTmn8oSh1PikUYC1a5RCl1VLmMk/B6e5i3BMwzf
	aZjWJjio0Mm+8trhgE2tbmgzFlm6BUdCZM4VvHYyMLFf9B+IhcybbTvF5Pbf8eyzJVb/UAicHnm
	3sqEdqMVoU6h+4hAD4qzNXOnLfvT5rtehab5DlTaUmcAwFWI1t3UfgBS9W/S6F9sOeMYrC4QiQL
	GbK38nygnv5Nnca0rMK6mN2ldOrNHI6A1ctUEl8bBuEX5xXumgHGNldE1oACZEHULmAaIc6WiM4
	qsIH/tZC0yRWgN9Tj/T5RFOoLr58DbVpTvG/X8KeEHPt6I6q7mbDZrFBYb2yfWMP6s/R50/SLea
	hm7vGWhXRPEkvgiKQbNsdOXW97SGZii0rrtZu
X-Received: by 2002:a17:90b:4fc1:b0:3b0:9a0d:b825 with SMTP id 98e67ed59e1d1-3b3d07ab104mr4002171a91.45.1795050669692;
        Wed, 18 Nov 2026 17:11:09 -0800 (PST)
Received: from localhost ([153.61.198.249])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3fdf456d2sm650359a91.13.2026.11.18.17.11.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 17:11:09 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Thu, 19 Nov 2026 01:11:08 +0000
Message-Id: <DMYSCT1OYI5F.2HSYP9MZ2BRJU@gmail.com>
To: "Maciej Fijalkowski" <maciej.fijalkowski@intel.com>,
 <netdev@vger.kernel.org>, <bpf@vger.kernel.org>
Cc: <kuba@kernel.org>, <daniel@iogearbox.net>, <pabeni@redhat.com>,
 <edumazet@kernel.org>, <horms@kernel.org>, <davem@davemloft.net>,
 <shuah@kernel.org>, <hawk@kernel.org>, <john.fastabend@gmail.com>,
 <sdf@fomichev.me>, <willemb@google.com>, <petrm@nvidia.com>,
 <bjorn@kernel.org>, <magnus.karlsson@intel.com>,
 <linux-kselftest@vger.kernel.org>
Subject: Re: [PATCH net-next] selftests: net: don't warn when bpftool is
 missing
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
In-Reply-To: <20261118165338.1064930-1-maciej.fijalkowski@intel.com>
References: <20261118165338.1064930-1-maciej.fijalkowski@intel.com>
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

On Wed, Nov 18, 2026 at 08:53 AM Maciej Fijalkowski <maciej.fijalkowski@intel.com> wrote:
> Based on the bpf-net-xsk-move tag so it can go to net-next and bpf-next
> through another shared branch, as Alexei asked:

Acked-by: Alexei Starovoitov <ast@kernel.org>

Thanks for the quick fix.

Jakub,
could you make another stable branch to pull?

