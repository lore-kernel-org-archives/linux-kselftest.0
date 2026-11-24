Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795556595;
	b=afnGxuvDfG9pXEj3DIdIYdktdo7qNw6u+L7iMDmXDLcyP/3ky/UJ7GO0ElamPU5WKWM3
	 cClpib1d8gt/ZdcWLeDSuXzR67wuQ0h7rkWweMvYaNbEjwy+7vwBqOfbpBe6/nweAq/Jn
	 rij0jx3lBr80cPWr7JGfqVf0lC7lyyDPiYbSa7SuOrFq9yUNGkvXMX+oDIgsmaDyUVqrB
	 gAvNHk3mWGGJjXZfLRDtZKKLdRjNz09zFQOZcVLxZukDiDpLOVHOPHXXW/P/Mr7vaHTpN
	 rEOiGSS2I6lGTecEA+n7egJFsaGrjzjHawCQBzH5eQq8waH61o87FKgf1sSsZduHRSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795556595;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=1dgevjOWuJAYh7LIS5HDx0mssJ5LCiALLAiYYaKE9M4=;
	b=V/e/c2wxDOrtjyhKnkeoIfINhS0zjRQLXHDddoi0mSoTL9IFD6NdD75uIfBqcGLwsv8F
	 PE1IkQCZqHX7mMduQI2iLNea3BPlVVQs9gmYw30XMDEZ7BMkv6LdBRUDADqAaZFS6bxby
	 euw44bojWwPVFFZ/ZURWGHXczYnP1CJ+tQfWjjqPbPsbec0QNmdWxwODs45NwjNBKfpQe
	 RFpt52CsNq6Qh9SJgpmQ49gZyZdi7NKBT95ElV7h4lMzRclR1B7m/ui3f4F1vfxA6izAs
	 EGT3oSumax2QQMxHa/uNKAlFqqT0BkRkaNNHUI2A56IFw0aVAWR1ieD6VvrHRzq7B9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0LgHWBrb;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75C61606A321
	for <linux-kselftest@vger.kernel.org>; Tue, 24 Nov 2026 21:43:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75C61606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0LgHWBrb
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-4a511d8a394so518642f8f.3
        for <linux-kselftest@vger.kernel.org>; Tue, 24 Nov 2026 13:43:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795556594; x=1796161394; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1dgevjOWuJAYh7LIS5HDx0mssJ5LCiALLAiYYaKE9M4=;
        b=0LgHWBrbm09GnvzktQXlq+YoVhTra+a8APFk5vqOolCQeExJ2faUuCcI9hv+G/9vCv
         Y67rTSPHFaLPgYL80KJv2kRu48ClOL7d+Pguh3uoSPikRzMiRgMmwMYXC35wXS9K486r
         VxHTpTW5Q7cqFI6ZBAqWwec1Rt4r5FgfiLu6EI0euirfCHVplEa4awaH+j9cesVX6RRk
         UJJg18yWHb0hp9bSHAWODvxczxKVMBykGIdWtrgK1bvLKecrE4Yd01mpNRSp3MjWSY3p
         mDNbqM3QgFP2ND0EuUIcaDnK5m0rdjhwBYfdGOzk3ifogWrpN83n5RZZMDEDu6dRiRLy
         z3ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795556594; x=1796161394;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1dgevjOWuJAYh7LIS5HDx0mssJ5LCiALLAiYYaKE9M4=;
        b=qGg0LJAXWz8F8Fsubs09/Tq3ehMV/9aUu8fcItGAUuc4bTZ+ugnkZIX57G8BSZ06g8
         Zi8+PO0fT35LknPVy5JqNwJaagIGklc7md9gIi8PNCbRdCmAnlaKowZfJOjNGDZB/33q
         3fqFdKFIzUFKVMYAO99XdbVhnVhbhpgPUVrM5wUBvC6sePjfHSrqCARpqRXh6kIsW3RA
         UXqn2dIOTzijQB7Aum/6E+DTfqiyq4d7P0pk+82wHRVP88PCWgOhEo4sDJ5ettyXjvFb
         qHtv681xjTx7ICsD9/SFWkksHquXn6+sIpFp2tDFfjchUFAUkHiEfjE6+K2PV2Wave08
         qLJg==
X-Forwarded-Encrypted: i=1; AL+hErG/D8OeAPBIKHTQ8PD+zN/513cNMIG5a3e3f9xJoAspIgOFZQXuf5KenfD6bgupxEJwMGydH2SOrzfQNn0scwc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+2+TjWcm+6xJSgGYNj32VTibbRwFEJ6PFO4tnt7WlSDNh2W7E1
	KyFGXLrBwZ8I1AooheB4/qNdPd/MXm57Q0uqnYAClNplbxpejF8rS80r
X-Gm-Gg: AZFdTZe4oiM7Xl45SM2jTk2KadsXEZrvnKU3rxcMiN9WijqlILNsrXNGYj72f1i/IIf
	Ik635xzRLB9Zb7wrUWQCstxMJz3LKygo/ATL3PMzoFcRUt9xwKdCjgfzewYRkC8MWnuGDoETjxi
	3v+UYYB0iDCg0Yh6nQVrM2foAlXRGzF7CrVv0rZDcwWoEgVpxAVZ4CKO6h4l+VVFlxey35EeDZk
	PMAHdfao85qD+arEykjMu/avDrB6qqHVmWESXOOQ1UCCSU47JamJzIQ8oXRfCojGDZFXsNNz692
	/WFWNMcgyVEQ8pmrIg2gtOnqk5LRZQk2ERBUUPyVXArSEcK8gHpxikLXChwKVETc7AQ9gbJfa1g
	RwhhxfIfGpJe37EKdCkkxsLlCfUg0B0eblOfjJQ90j2PLkVudXL7swvu9T37Rgb5uDeOlxDd5Rq
	CbxtPgtEs/cHdMTW/5JQYdJqKPkG8WlUQzrmH7it4utT/yhM6bvwyLISQZqMfY1m07ajM1AgwyT
	4MMhB9c9fthiadZaVow+DXSSeQpTukoJH1bKWnzC5In4Mq6/lOpB2eXBeHZulcHbAPcwqREqyda
	N6FBUb7gPD0903PVwWc0kuM/R3NMi9gvlfUSUeFgctc/sU96YbakERx8nHCgAObn+kCg
X-Received: by 2002:a05:600c:8284:b0:4bb:6c01:de9c with SMTP id 5b1f17b1804b1-4bb887f55c1mr283837645e9.2.1795556593828;
        Tue, 24 Nov 2026 13:43:13 -0800 (PST)
Received: from Nuel20.localdomain ([105.118.4.83])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906640a2sm244195265e9.0.2026.11.24.13.43.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 13:43:13 -0800 (PST)
From: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
To: tianyi@cloudflare.com,
	hangbin.liu@linux.dev
Cc: kuba@kernel.org,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org,
	davem@davemloft.net,
	edumazet@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	shuah@kernel.org,
	ast@kernel.org,
	daniel@iogearbox.net,
	hawk@kernel.org,
	john.fastabend@gmail.com,
	sdf@fomichev.me,
	skhan@linuxfoundation.org,
	kernel-team@cloudflare.com,
	tianyi.gao@linux.dev,
	emmaonana18@gmail.com
Subject: Re: [PATCH net-next v5 3/3] selftests: net: veth: propagate bad-settings check failures to exit status
Date: Tue, 24 Nov 2026 22:42:55 +0100
Message-ID: <20261124214255.12280-1-emmaonana18@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261123140946.13992-2-tianyi@cloudflare.com>
References: <20261123140946.13992-2-tianyi@cloudflare.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, 23 Nov 2026 14:09:47 +0000 Tianyi Gao wrote:
> If you squash this patch with patch 2, feel free to keep my tag on
> the result.

Done in v7 https://lore.kernel.org/all/20261124214025.11603-1-emmaonana18@gmail.com/

Thanks for the review,
Omokefe
