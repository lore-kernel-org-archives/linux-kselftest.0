Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795207362;
	b=Q03zgD/JUpWrEhdofiu7VzroyIRbP87cX5wM7d+eQQLKjRjxY3gkA3fCr2AswvcnMF7f
	 Jzm8BWADuClfqcdGnXOkVelqLhhcOIWkTRKYCN0/AZJVv4dJguXMcUlzuHfev3FrtGkpP
	 5z/oU0avLenNsxIl1kADA5TohB5pvB/HV3w3zTNzb9E28LyV0eBzdWkF6TA8gwJKvogB6
	 lI2ogkO9p1k5aD8UXN8RcM3cVYcyW3RYvL1BT8+qcsp4gPaxkQ6dAjmPd1GMLvriUuB75
	 DQ9KfVmi6mZ7JQ8k11n4TKlwnsFeqiYkLl38lU2AgCUpg6BjJz1Kfk04QZrDbHooXeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795207362;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:MIME-Version:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding;
	bh=zvhZlU0ddPN9o2nM/nrK5XTVxzJuCMmPH0NhVRQSvdI=;
	b=axh3B9IelaDOj4v979hur0r1Kp2fZLCv5KI2At61SzHGjfnnXljUK4T2wMUImsg+h5z9
	 W6wN/noNkMzTysGNuwESdV9cIwbBRJb1wXL6skwvn8JUFpiq/5kAbW5I3PbnWjB2PydG6
	 BE9GyxnWTDwu64Kz6rSq3wmIzBXEND56IUkicTtKlEDGWDLIljl/V9DAMTlNS+sHQgxDT
	 8zJoRzI1nnQ2AlnMtqf7pUaXQ+aYEZ6cEQOCXDP1efn1L+AEuko6JplyT/hy8Yo+cFybz
	 WgPNy/o2JLSl2E1KfEKR62WSV3zsJTRoyqAGpn1fUJr6rJjrDo8HZEb7eT7tf5gOO6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=kernel.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.160.172
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BA4F60A260A
	for <linux-kselftest@vger.kernel.org>; Fri, 20 Nov 2026 20:42:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4BA4F60A260A
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-537548b811aso10762781cf.3
        for <linux-kselftest@vger.kernel.org>; Fri, 20 Nov 2026 12:42:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795207360; x=1795812160;
        h=content-transfer-encoding:content-type:references:in-reply-to
         :mime-version:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zvhZlU0ddPN9o2nM/nrK5XTVxzJuCMmPH0NhVRQSvdI=;
        b=htFDBID2XEyjV57hGqCLytFuVzkhgIGVsJ0bJX4QXR6TTtY7fLzIePy0iYCYW2Rvz5
         5vHDt4esrkqQJ+iwyJVBYwBtplAwDr3yNzu1cWXqaZK2ooLMiRV6bax4nfVSiBl6wQ1v
         i33VYvnsW8h1p7icFohL94Mz8pWCXSOZ18Di7gwtXkIXKlJhT0i9kS2TOrF25tOHTekn
         TDrJbGMQBYH2vxJJea/mVmTXhxc0hlpTjvIveqngniurO7gzr/B2D2eHlPT37xQ95PJn
         sq8aWAVCMwh8Jjl5WyNa90PcvaX1+tdc4zjKejMdIJ5XToJOqYGXe1s63lc9QubRsTGr
         sHsg==
X-Forwarded-Encrypted: i=1; AL+hErHj04iJtbQjEv9pcxHCy/IqtK3QZkaaca9ADIiCDrkjYf3iHN4r+ojDn+0+2zpO12mmbLRFdBxpcddEPxCj1zo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+GahZx0DsXJCYOoRrEN3NHuFtNWAt8FnshntxSbpaBZaEpmB1H
	xtuE7l7dVOqrJg/0stziO6asRZEzflxcTMjW0BmJDzrPgapnNBg/7KSa
X-Gm-Gg: AYBFou30tixmNYQ+GwRf4GyT0iYPf3+/Ehuw8RwRYRMRMHMA3JpaT4cilyOtmcAZDzl
	vrwA5LvcjUwgRcFFyPCIn509Ns1f21J9XKG5Elqj2NVDGp/i0h8w1x95cpL8cJa1D1Kw5h1nrgw
	yQznv9HWCvU3xYkZPMoIVSbX+d5i/DJf1sxDqePWXrHJg7h/CXLn17vPK9Ku5PhMgow2P5JZ/i0
	qEi8cnKhAlgZ1ThvJGZ036Fql7uR7nK+S7soDLcmNChw3PDZa3q+DgBITVnDZ5CXvkxRrjFGUuU
	CcHYasREU2igUOC8TtyhDL706MXgI/mxfOUbGl+nPa5EHX+D+pteBsOxxHqTcMlusa4pCL7xVT2
	Bn/Jmq1Km1ORHJOcQzQpDIULNVrH6gwY/RgZGMt3gaLVQQp1pTnsZlYJ3Dm2vqE0ZlsZXLH3+zj
	CV3wfenmY5u9V/iI8WSPfEMD5laq+DOcv6p9xS1TLDg7uaxOLeYPOHSYII6/opdtM+An9Ycxsps
	gBtzIyBPTz+UNht4H174g/M3ZRXaiduhnzngoR1EcJ+jkJbRsoJzYy8vqApA2yF8UuzYgREcJ8I
	j7gtriE49gPHjESymMo9KYAcKXt0q0zSzD9HQmK/oyyi/077I+AihjGYIa/2dtq+cT+N+FM1Rx7
	6U7U/q+odW+QC4c1pvmGxeMu+44uHid0+HZpfqf9C2mUs7ZfGr44V
X-Received: by 2002:ac8:6f07:0:b0:55c:5ebd:8824 with SMTP id d75a77b69052e-55d76a6b9b2mr73460561cf.71.1795207360201;
        Fri, 20 Nov 2026 12:42:40 -0800 (PST)
Received: from localhost ([199.170.132.196])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d788116c9sm32657731cf.4.2026.11.20.12.42.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 12:42:39 -0800 (PST)
From: Tamir Duberstein <tamird@kernel.org>
To: Jiri Olsa <olsajiri@gmail.com>
Cc: Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>,
 Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>,
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>,
 Yonghong Song <yonghong.song@linux.dev>, Shuah Khan <shuah@kernel.org>,
 Andrea Righi <arighi@nvidia.com>, Xu Kuohai <xukuohai@huawei.com>,
 Andrea Righi <andrea.righi@canonical.com>,
 Bing-Jhong Billy Jheng <billy@starlabs.sg>, David Vernet <void@manifault.com>,
 bpf@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, Andrew Werner <awerner32@gmail.com>,
 Zvi Effron <zeffron@riotgames.com>, Andrii Nakryiko <andriin@fb.com>,
 Emil Tsalapatis <emil@etsalapatis.com>
Subject: Re: [PATCH bpf v2 2/8] libbpf: ringbuf: Prevent NULL callback crash
Date: Fri, 20 Nov 2026 17:51:54 -0000
Message-ID: <179519711442.18576.14389384506684582728@kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <ajVKM9tJskwg9OFa@krava>
References: <20260618-bpf-ringbuf-fixes-v2-0-33fde039ddf3@kernel.org> <20260618-bpf-ringbuf-fixes-v2-2-33fde039ddf3@kernel.org> <ajVKM9tJskwg9OFa@krava>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

> it'd be easier to review/suggest the solution with more details on that

V3 includes the caller-owned iterator and tests using NULL callbacks.
It preserves the validation merged as c0628a0659b6.
