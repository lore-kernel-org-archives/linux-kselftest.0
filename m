Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794836428;
	b=JI9SgGEbOFEsl64NoCGz1Uay15yjnJPGwUqafwUR+E7Fz81ZnD+E2A1q3F077bhiBLi7
	 +s3D+mtSWwggdw9qCEUFZkaPWVvIsrUq8YwAsPYbD156AMts8RDK0jewTsXOjW9eTZx/o
	 c00Wq57fJWkPRjgNwvPn4f4FwN+yL79X3/8Lb/sRqZ7vbR3xhYDYGyEynwnxeaP2r6Mi3
	 eL9uStf9x9j1wlB6MGnOezOy01AtpVDLH5ySq8u/2o6MxTqEOs3JSraYaWSFUa0IMCNsU
	 /4sqzIV/dkF0JU+fwp2RdwzGtN8VQmR1nOt8YJTi4AuHmh9xYiJtreS37NNYddnR4zw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794836428;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=wrdcdttsZ7Y+FKLVhKP3yfAgeP8cp4gI+kbn3HQkam8=;
	b=jbKxDoITtnptVjMHiU1mDqcEccetwUjFW0iIw6RQxpEYspDyA30YoAd07VMAy1xtGAIr
	 J3ajfRE2CnYWIOrp/+nwySuNouy6XVdhEIZgRxtUPHEeqQJJS0f2ZoGalyCzzZOuiGz8p
	 Q2ExKDiaa4Z9tyJ8SwqAbbQz1tbPqFuvEeJ/itIFiz7oIgYMXj1VDFO1ZJmj/ry45YY/j
	 XCWWO3YGS9K2jXW+v5nurY6hSerZP+iU5sahuH3Vvt+slq2UIh8kUUeD9MMbDqNShabCA
	 gszkeg7KNqqI3uUFnjAybS+tutUEzXaXXw/gnLMDBZE4vD6RakU8CMqJcaKbZZOKd5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Q2WPmp5+;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10D74606A890;
	Mon, 16 Nov 2026 13:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Q2WPmp5+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43B3E1F000C8;
	Mon, 16 Nov 2026 13:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794836427;
	bh=wrdcdttsZ7Y+FKLVhKP3yfAgeP8cp4gI+kbn3HQkam8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Q2WPmp5+BJ6A8U6M9SELLKrOsIM4+EP3Sd657t/2tdHbA8zM7d5o+aGG/HrrvNWGI
	 z5iMsQldw8skKSZG2hVSqWw+KwUN1DAhvHwSVfqNUB4TUcs3pPrbvbVY5OEUdZEv+q
	 mD0DUoouUUS57SI0CPZOasMLvRAHl8JiITcte1axz+oiELn4i7FEpJ7KjKIOH28Jnq
	 Jl29UKbapBWXBaNOFhJEFm31ONmDP83um0XNPRtl2KscdiQPBkq+Az8mhyUD9W9QZS
	 oP90ei88TFq2AcU3CryGYKgjyyOMg5Es3yqr7igo19uFD2IdUphHkLtQ2aJ5553TeZ
	 W+kOSiL0rTeLQ==
From: Pratyush Yadav <pratyush@kernel.org>
To: Mike Rapoport <rppt@kernel.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Alexander Graf <graf@amazon.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Tarun Sahu <tarunsahu@google.com>,
	David Matlack <dmatlack@google.com>,
	Samiullah Khawaja <skhawaja@google.com>
Cc: kexec@lists.infradead.org,
	linux-mm@kvack.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [RFC PATCH 1/5] kho: add KHOSER_CLEAR_PTR()
Date: Mon, 16 Nov 2026 14:40:06 +0100
Message-ID: <20261116134013.1636689-2-pratyush@kernel.org>
X-Mailer: git-send-email 2.56.0.611.g1030f0b940-goog
In-Reply-To: <20261116134013.1636689-1-pratyush@kernel.org>
References: <20261116134013.1636689-1-pratyush@kernel.org>
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

From: "Pratyush Yadav (Google)" <pratyush@kernel.org>

Add a helper to reset a KHO serialized pointer to NULL, as a counterpart
to KHOSER_STORE_PTR().

Signed-off-by: Pratyush Yadav (Google) <pratyush@kernel.org>
---
 include/linux/kho/abi/kexec_handover.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/linux/kho/abi/kexec_handover.h b/include/linux/kho/abi/kexec_handover.h
index 2f4fb9c639421..5fe9c5e10ac89 100644
--- a/include/linux/kho/abi/kexec_handover.h
+++ b/include/linux/kho/abi/kexec_handover.h
@@ -132,6 +132,11 @@
 		(dest).phys = virt_to_phys(v);    \
 	})
 
+#define KHOSER_CLEAR_PTR(dest)			\
+	({					\
+		(dest).phys = 0;		\
+	})
+
 /* Loads the stored physical address back to a pointer. */
 #define KHOSER_LOAD_PTR(src)						\
 	({                                                                   \
-- 
2.56.0.611.g1030f0b940-goog

