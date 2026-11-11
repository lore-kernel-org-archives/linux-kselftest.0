Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794356665;
	b=qwqUjO53LPnmMiiFlsu6RIo5DF/8MCcK7D9eAfVTYdMhSjxpnC91V4ikXUtim3A50jPT
	 escz9WtOtlMuUy8udoOMwInHXLFxkRAlxi8wJ3yBFaPpapanwPfCchQCFFl62FuuyCRKT
	 DUY598B8FVaT+W1JpsAoXpCrH//DJL9QI32Ck1DSFwMbM2tGmeERoBup2BBsJJDvnP8K9
	 bYh1rTF6lJBUKvc3IvyBnviwcK6jW4/B4sP0P/ULayoZA/B3nj55Qsmxj8lcBlM9PjEkg
	 aG2sXAipY0AprStCkkGtEO1alKQe5prJRkheTO9ZlJjE9NEyhjH+t0u6BqBgMR0JlHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794356665;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=WlJZl+UE9pf/QC95ZJSnwsGYNSdLtTHc9yxgINOhNxY=;
	b=SLZgCwvnJfSYgW9FN4Ls+ZmXMnLo8WMqLsv5MSu0+Ulf54Ycnsb9oTeN+ZrgaljJNCoM
	 ytZSQ2JauTUUVI4pA5P247yJKYzCeWU3n+/Ea/3nqoZCY0qLLKFa8UZq62AzNGgpKnfiA
	 DOD953+V1Hlr1NC95SLa3PHKZXgg4NgdORRO5kV+XuCA+HXmV0jFe9YriRt0FE9z9e0TD
	 Lc9ajO24JPFkjX742580fl2FABvS+DRGClADFbEkhG/yYQYK9Q7VMdWg7IJ4AZhYm0zsO
	 6hJ55rQZSr7rVDH9TMiv9ZdpiuItFDKJJkqFXZYJbfhhl6Y03HnnFvMptTGCQdruPFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=p85Su7jF;
	arc=none smtp.remote-ip=209.85.210.72
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08CE860A6F4F
	for <linux-kselftest@vger.kernel.org>; Wed, 11 Nov 2026 00:24:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 08CE860A6F4F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=p85Su7jF
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-84586110393so2971781a34.1
        for <linux-kselftest@vger.kernel.org>; Tue, 10 Nov 2026 16:24:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794356664; x=1794961464; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WlJZl+UE9pf/QC95ZJSnwsGYNSdLtTHc9yxgINOhNxY=;
        b=p85Su7jFZ6yoicaYSLsRSAUeStCdDIVjHpc8l0nMwF1Ga2T8cUkPWsoJhSidQozccT
         9VfXHPEtDI+1iyAC5elG5TMivCYmn/zpSdGvYvxM46wmdTvdSEUitNmah2oX4ar24CC2
         iB4Nz7mOBnt70VOO3pxN8KGmB/JxloUHuWixW0af1AFirnKsKvWJ1ggy+PzQ5ELEVLL/
         +IkuOFmzp3MdFUCpETF1CGtgebDAePa68se8EZkBlrdzbhO03pFt8nSBf+V+Cp74MgdW
         Ki9Lirbeoc/TrbLX7SPh3xr7HDi6+NUK5280gQCgIbfzppffKHToco4m1uSGZ2nqW5Me
         y7Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794356664; x=1794961464;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WlJZl+UE9pf/QC95ZJSnwsGYNSdLtTHc9yxgINOhNxY=;
        b=v7FXjlkqAfIsqFrBYH+OrafQBC0+hEEUmQ/bISn5KJTh8LBLG3xq9kl3+JnMmaBWfb
         fnL2UEr//4bHJYGYgOU/OMHNFUOfhwRLUmCquSspSgJg2UlISFAjgYjpjWo7eU0vxkye
         b2JwA6lvekd4uUo3sWv8q/t/F5DHKG7/5cY5SjeRKETxOz9KrqZUpwyqXLqi3Ya3nVUV
         per8UsafyWeHWp9kiozkubOIGc4ltMbAJpimui7h9ZVi3S5snDDz+ymv0UEYCy6/+IHT
         yQU7aSx+x+Ze3l7e2WBgfYHF6BQn6wveH/nKJ5w/d3HL3Nh8JOb7iXN/bLCRO4XSnOmu
         SuTg==
X-Forwarded-Encrypted: i=1; AL+hErFrK2c96QXiUPVWu0E2SbP/3FrwR8TFzX8D/O2MhZ4R67qVFuWK7a5oMzhLK2ZgoTJN45trQtl+U2nElc4mMrA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+yClWLDuwjo4arP46+FmSqbYvNI5t8tSKiN2FlkUxdAprU3iHi
	fHinM1Xte+WI6Ta25w7xAWuvqUrcRkxh8ZvkYgGWM/4CCPIJygZ90+3mTiqnorSSMX6ophJnMbi
	hKQ1mvPsY6qNpow==
X-Received: from iovs14.prod.google.com ([2002:a05:6602:2bce:b0:9c7:8645:9285])
 (user=dmatlack job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:1a01:b0:540:5827:6d8a with SMTP id 5614622812f47-56b98d23beemr555789b6e.66.1794356663846;
 Tue, 10 Nov 2026 16:24:23 -0800 (PST)
Date: Wed, 11 Nov 2026 00:23:51 +0000
In-Reply-To: <20261111002358.1842967-1-dmatlack@google.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261111002358.1842967-1-dmatlack@google.com>
X-Mailer: git-send-email 2.56.0.542.g3ef89b7020-goog
Message-ID: <20261111002358.1842967-14-dmatlack@google.com>
Subject: [PATCH v4 13/19] mm/shmem_luo: Allow preserving tmpfs files
From: David Matlack <dmatlack@google.com>
To: kexec@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-mm@kvack.org
Cc: Alexander Graf <graf@amazon.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Christian Brauner <brauner@kernel.org>, 
	David Hildenbrand <david@kernel.org>, Hugh Dickins <hughd@google.com>, Jonathan Corbet <corbet@lwn.net>, 
	"Liam R. Howlett" <liam@infradead.org>, Lorenzo Stoakes <ljs@kernel.org>, Michal Hocko <mhocko@suse.com>, 
	Mike Rapoport <rppt@kernel.org>, Pasha Tatashin <pasha.tatashin@soleen.com>, 
	Pratyush Yadav <pratyush@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Samiullah Khawaja <skhawaja@google.com>, Shuah Khan <skhan@linuxfoundation.org>, 
	Suren Baghdasaryan <surenb@google.com>, Vlastimil Babka <vbabka@kernel.org>, 
	David Matlack <dmatlack@google.com>
Content-Type: text/plain; charset="UTF-8"

Allow preserving files on tmpfs mounts by dropping the link count check
from shmem_luo_can_preserve(). The check was meant to limit preservation
to memfds, which never have links. It isn't needed anymore, since tmpfs
files are now retrieved into a file on a tmpfs mount.

Userspace can keep using a linked file by its path until the Live
Update. The path of the file isn't preserved. Userspace creates the file
to retrieve it into, and can then link that file at the path it wants.

Preserving a linked file affects everyone who opens it by its path,
since its size is frozen while it is preserved. The permission check
added by "mm/shmem_luo: Require permission to preserve a file" covers
that: Callers need permission to write to the file, or must own it if
its size can't change anyway.

Signed-off-by: David Matlack <dmatlack@google.com>
Acked-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 mm/shmem_luo.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/mm/shmem_luo.c b/mm/shmem_luo.c
index 7242664ee4ae..94d617b15489 100644
--- a/mm/shmem_luo.c
+++ b/mm/shmem_luo.c
@@ -757,9 +757,7 @@ static int shmem_luo_retrieve(struct liveupdate_file_op_args *args)
 static bool shmem_luo_can_preserve(struct liveupdate_file_handler *handler,
 				   struct file *file)
 {
-	struct inode *inode = file_inode(file);
-
-	return shmem_file(file) && !inode->i_nlink;
+	return shmem_file(file);
 }
 
 static unsigned long shmem_luo_get_id(struct file *file)
-- 
2.56.0.542.g3ef89b7020-goog

