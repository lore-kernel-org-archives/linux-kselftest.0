Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794151460;
	b=1fiiPHlWMXHVv4rtW+emE8iRtF9xThVhL3MQi+BBKbueNZteXpr96iIKANlBvYV7F40D
	 TOoSuKsuIFwtWiVJ4RhH4zJBRbd/iG2ttUiGPdIOUABJW+4o9FQxCr1E0Q5UN0TYI59/P
	 S27bNqGlt+vLOtsMCkCog0ykPNKBCWfQtnvb69sk08tMlA9TJCZqqLjmUmBjPxkRUNWQy
	 MSoJZKTzSRjjJDgDxF0P7A+Mguv/QDKhmzdIubfttBmOpqr+tHyIFgADrvMLcRiy/ygGd
	 0rqhlrcoW4ubTHGhS4m+jvlebeEmOdR1wTlUfR9JYH9yAkbKQJkOSgfFkXYKodC4Kgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794151460;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=5H2H8MP8L+/rXp31cDc9VnUcbqmvBKhHx7W0RFsHYLE=;
	b=5hoDiGxkQsxENzEZGyWjPs27HzlPNsZqwP2m4k5BrIJGrtVkKaltESYQnprMwRziQNAU
	 /6KvNNXFw/ogaZogg86fGypPDVz1vJA45tUXzY5V0SUTlSUUfRbTEUN0339kitQFysTnE
	 R+1pQNrw7bS18taikZaq9hECo/Zb4whOMmi07Wz5rFV3DjL7EkaKdo+eoCI4DLRgTV+2X
	 OK1TPBxXL9105oLeAhUPaKbBr9O/Bu+msyWOM+7EPgJVJcCDqAfp57YbgeASUEpzWlOyT
	 2P/o8JTCcD/MiHDfAIeIFwwGGclgP7eLzR8cDtpkqld2f2kvYgXApsU2rueE7Bui7nA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=soleen.com;
	spf=pass smtp.mailfrom=soleen.com;
	dkim=pass header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=VzLHlha2;
	arc=none smtp.remote-ip=209.85.221.171
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B2C7606A31C
	for <linux-kselftest@vger.kernel.org>; Sun,  8 Nov 2026 15:24:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B2C7606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=VzLHlha2
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-5ece3ab2e91so38675e0c.2
        for <linux-kselftest@vger.kernel.org>; Sun, 08 Nov 2026 07:24:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1794151459; x=1794756259; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5H2H8MP8L+/rXp31cDc9VnUcbqmvBKhHx7W0RFsHYLE=;
        b=VzLHlha2mdx1LQqvx5whvbUtOCVSCiG6OmtDhaZuB/r471T/9qSBWxLL9WSFW0Olf7
         G77d3EHfKK451U778tccdeTga1CwXe6IPTQr7/uw2pBEyA1+TFuCWItAMnzg6Zr2GH5+
         6VJhOUH5o78i6E+cxe/s4LLwiIjPVwvSXImgqsUijxEVLzO5jzj+UyG/6g8znGG+D/xs
         L89xi2e6Si8NozKOQKJbp6aIL+RZ/xE/P98R9rq6WDrpiA6pIXUF17XpIv3GqPNXWsvv
         NJkUkFs4sa7uzz/cy1hzwwi4u8U/lpHhMtRq9hR0nIwSAcgMzUeq/grYXRR6AeffUIf5
         v9nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794151459; x=1794756259;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5H2H8MP8L+/rXp31cDc9VnUcbqmvBKhHx7W0RFsHYLE=;
        b=d4LeigbrjmIqzl239pW0sGN+WanL4LJC3UIHnNttwdYM28UGxgto5tr6nQr/T1VgXl
         Ge3x+U9wa/9QcHLk/47ARm2sjXMWaBSm4QiSc/1O6+Te0RXbIcEXRzxuncPVT9ptLbWs
         DBj6a3YIfqq6x19Pces4CrqKUQEMXiMBveyPjP4k9I6Qrk3j1mfpiQZB53WUTTgJldYS
         APP3l9YFdLjuOqdFoOP7SeLyLUimw8+6jh4aT9+SCLmlFVkIgzOgvO2mYjsikpXQJNv1
         3K/jqpfNgy4nRrovl9Rizz0tz5dW+97WhwZZhGiwMs/NFFsNXsYu0JhchbzLdNVwead0
         OxuA==
X-Forwarded-Encrypted: i=1; AL+hErHVNfreqWtAcd8GK237v7rYETusMjguk5AdImYKyZveMvVUVfh9GYMVOeERsbt2dAaJI2USTpvx9/8Odt5lhmM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9RZSiiA9yg8fgjlNgXrobZTt5dlj0BSV72uLhDuIt0AyR1QZuj
	eshA+Auzx8uRiVnM9X7Cd/RuEg0VheJ+Cg0cKMcsQpaqkupRRJ85EAXKUMW7AUvVT3s=
X-Gm-Gg: AYBFou1ThfsOAcfHQrd8EMXUIrejY5p/MAIdpTUhAjbQP55JyT7nHui8VyHGLdyebN7
	FvlsmFvb4jIFxfRvCw050SnL2aetG6zzprEqDiPT6hhmP1ZJ39U0WHgXu5dBGkH1NHEJJszSXIz
	FkjoiymVMkKjyUN1ztwIFGWbKNWoT4PBSis5GQXSTRfxiLYjcxboOyrTzbPCRn7FxN0PvNRXRlh
	Hi6zmuOpMCM44LDPtBZjU075aHdI0j3OHp1ohnavZ1oJG4ucFeUK18cmbGyCOgXsn/ALOCkf7yX
	z+g10vEEyIiOeUiFYYIpbsG1dYuBRflabzfMB7wgwH1mAVrVHjALbXuLHOdrIX/lg0UAn1hnWg+
	T7Rhj1WHRIIjphfsAiEvO9PAtkZa/cDr0dJiioRP9g2r6Tg6rGDEecwHubbscHpcrirgGg3H5EM
	JtgAhe2sadOtAXICxzCHOLIkjU28dEhgSu1V+lNu3M83pS/1fWiy3c+uYZu/ZpbfMT31OXVmws5
	txwZIQNvSW6tMpQMPJ/VELyVLcbJ71K/tjGqA+q6s9RjPXmN0TxXmIKTZkM0xlnSXZI1V6xA9ze
	7vp38khes8XKBi1FyRrU6eR7iu2eYIPq9+ViZU+NDMDGxz/LfL6/lW9AedNMELFspUq0r0/sX+i
	r6Akek4rqYND0HvlyIw9gxwZksj7I55j4yR+JyB4fsWoxdlET
X-Received: by 2002:a05:6123:4a:b0:5ec:c162:d58c with SMTP id 71dfb90a1353d-5ece7232e04mr468275e0c.9.1794151459109;
        Sun, 08 Nov 2026 07:24:19 -0800 (PST)
Received: from soleen.c.googlers.com (64.167.245.35.bc.googleusercontent.com. [35.245.167.64])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ece60c1adfsm2166205e0c.8.2026.11.08.07.24.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 07:24:18 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v3 1/4] riscv: Call early_ioremap_setup() before
 parsing the DTB
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: Chen Pei <cp0613@linux.alibaba.com>
Cc: pjw@kernel.org, palmer@dabbelt.com, alex@ghiti.fr, rppt@kernel.org, 
 pasha.tatashin@soleen.com, pratyush@kernel.org, graf@amazon.com, 
 shuah@kernel.org, guoren@kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
 linux-kselftest@vger.kernel.org, kexec@lists.infradead.org
In-Reply-To: <20261106071459.2003-2-cp0613@linux.alibaba.com>
References: <20261106071459.2003-1-cp0613@linux.alibaba.com>
 <20261106071459.2003-2-cp0613@linux.alibaba.com>
Date: Sun, 08 Nov 2026 10:24:13 -0500
Message-Id: <179415145357.358073.15510298244264317494.b4-review@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=612;
 i=pasha.tatashin@soleen.com; h=from:subject:message-id;
 bh=3Y64H37LmlHFT1VEQVtmy1MOdzH3F3b2j267UF4uRWE=;
 b=owEBbQKS/ZANAwAKAbt3KEzbc3reAcsmYgBq8JQgz9JeNn8fjKYo6x7VzlFWQWT/Lp3pbpLNs
 SP93uPVKjCJAjMEAAEKAB0WIQRBMaqT7LRvGvB/NmK7dyhM23N63gUCavCUIAAKCRC7dyhM23N6
 3uGHD/9Puz8wWfsenmFRRLxdqDDp4alEi2QGtibd3g1gVeZ7Erpg749NWd29hLL+Nps+tMLws+e
 ee5EPvfyBmjdqv2aB9jwLRhFRBVCu+uecsYEpi5pIvZnhLUYS7pLfzWQESHepH0t1Uo1zbs2ThQ
 w2QeZ6ys+x3aRZh5P4T57xtD9ZKTMO/lx5nL0zQ7y10Lc59MkvZiuIpgegVGt+afWmMp51e1LMU
 zZTNA54QUipvJplO8tdXHzC2R9tnDyCkspRxxi+iIQ52w3TaF2LY0HGMYNKjv/GWdQGcaMoORg9
 HPw3OPmHgI8x2rX0qbSZR6VLp8KqKd8jnlSzWcI1w2NMxzwF5tswwwvmxHxRXWBigTxL/ZI91qg
 FBK/MLdWhxbZ2ikerG6+mpnyJh8ifXFLI2QXmbVvjiKZTghn9/oq313tuHBfPlBxHLT07rp1gwh
 EYQ/h5X/PzAQOWJTT7h6f6LvoJANqrnrTIh/YVT3FGSGfOs82HjJtsmvkPAbaY6bCM1fgcy5Iu6
 o0CHn9bw6TOupWQqjrVgowolhg9vSeQNBv0rpoRTA/lmGKBzSTNtRYZeZfeQCViJ9VL0X/OlK9C
 l+fImT0gCxVTujJCKLC3TbO2Nb9dqnsI0iSqK/Ftgm/7Pt3MXpy48agJgU4famUxHxEvG0dTa/r
 P3vcc/gP4HWC/tg==
X-Developer-Key: i=pasha.tatashin@soleen.com; a=openpgp;
 fpr=CAAAB722DD22A081F0D49F35633A6A993D43B569

On Fri, 06 Nov 2026 15:14:56 +0800, Chen Pei <cp0613@linux.alibaba.com> wrote:
> parse_dtb() can reach early_memremap(), whose return value is composed
> from the slot table that early_ioremap_setup() fills in - and on RISC-V
> that setup ran after the scan, so the mapping came back NULL. The DT
> based kexec handover parsing is the first caller to hit this:
> kho_populate() cannot map the handover FDT and the handover is dropped.
> 
> Run early_ioremap_setup() before parse_dtb(), as arm64 and x86 already
> do.
> 
> [...]

Reviewed-by: Pasha Tatashin <pasha.tatashin@soleen.com>

-- 
Pasha

