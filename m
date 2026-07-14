Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36B263DB980
	for <linux-kselftest@vger.kernel.org>; Tue, 14 Jul 2026 22:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784067699; cv=none; b=PAP+9Tpz9I2X6m4jFymuxz/q1i/4Pl6eVTcnm57PYXxQ7aX8l476K9RELaYPEayvbFJAX2ucqNMaGh991kDzM2CCgYNABjYbBidA/i101/XcDTB770ZTZjZEl+/RP92Ij8dqZgRB1vE/cJCM1YvYvsdA+QsLiOjMYC4U259mg5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784067699; c=relaxed/simple;
	bh=yfrRBEA8+1jTOU/Ov53fj/3O/42x9krywkX8bMxjRO4=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bunlJ4RhvTQZhAm/leO0j/OuxVdCSdhfwaUpcUMJMkqNzoK1NvgRWSne08GEfAiEqpDMpW7FkrhEhl6jp7D9u6GDKHJnU6026TYC5Ox7wZKzTdIMv1rvKLgr9i7cusH8c410aNDs8B4GRb0rI3yS/ECLSG5oD4QuRgiFhx8JFCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J1iGNVTW; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J1iGNVTW"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-8487b7b4066so4753652b3a.1
        for <linux-kselftest@vger.kernel.org>; Tue, 14 Jul 2026 15:21:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784067697; x=1784672497; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:user-agent
         :references:in-reply-to:message-id:date:cc:to:from:subject:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=s/XP8nJGTiSx4jpNVu3XVkKeZD1kh7QswKhz9rXqGp8=;
        b=J1iGNVTWEe0KyQiu+5OStpLUutxVy8Gh9wWoQqtFoamqdxqxQgOIATZL8pqk99cj+b
         7l6aQCg6jdHL8gyDaVYC9sqCgYg/0R9/RHxBFnbBnExH2oQAbtjFZjJEBVoilbCdReTX
         DdAxpnjAGK4/gSJMJTtBTcQYK8tUgNVHu716ES7B65rFzOhchWzw30Ydk1AYvD4InDsk
         5wtJjKtyarYR2MA6ao6ruIK1W+IfJZYyql/phkA2JinAzCV0JLyzSyYr0jZuu8xUxDOo
         0ByrR1ob3xk3/w90uoAzs9o945rEBI0DraCcd99SGGqJdHlEe4A1fyXHtk4DA1qcBceV
         MXaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784067697; x=1784672497;
        h=content-transfer-encoding:content-type:mime-version:user-agent
         :references:in-reply-to:message-id:date:cc:to:from:subject:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s/XP8nJGTiSx4jpNVu3XVkKeZD1kh7QswKhz9rXqGp8=;
        b=UfZ5q1duQePg+5YwNS++WXv6nSscGjlx4la5JqUoD3tv9dNYqj2aBg9jfo7jUtH9E6
         8PicHWgmzdJuCzBQZtVWN7rDe/VUFLTIxIB8/jtn9ftS/sBn0egCWYw116ecxQ66hcZT
         lT1CROVO6/HCoq/dT+CJ78io8uRMc/HtBMjSR8HgGNnXsZThOA/VzJdFwY4vNRmy6DtP
         GsDHendnBeu10SwwKnTX14GCF/Bya44jFybXHVaD7RCJzKw8ueSmdhtAbQe3NYgTNs5X
         xklv5GCNnwS1A808cGpGnerpPU3GCQGb6qKYilqdP5J9pY4NRSpYwMZIbapKbG1a+INw
         6/Bw==
X-Forwarded-Encrypted: i=1; AHgh+Rr1KIflDyGhwaLBMdJhSlUM55I3a5mtiDi89uF0IA2I0Exx8GHQZRaiP43aiCPk7yT2Keuh47A6rMfDJxwlYu8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwOpGGx61uJrBo1I1i6q4kKVtqVLUPFMmXRSfvsHMMS1neh3R/p
	5YNzlOQjPfPmzx7zPc+hmGmwYcaLxC/8Nk1I+msVHGWt8U2uIqEpDJMJ
X-Gm-Gg: AfdE7cnxRPnqGJz4S2T/uhN1DJmHbRcBQVb5R1km13kz5XBZDxDxixahx/Qbf95+Ny8
	u27QYclaoxx89No8Q7EaOCwALlvXKNyiGuVAgRVCTBFSMF1qrjf3r/FFr9dvb4nlP49Rwmq+QKn
	UbKttY02nsMW314XQ+NJIVNTrxatd4Hij9nZgAs+BWE8et029mnHRq9Yk69VUMw8g2lneY0qjp9
	NtD+0TL1e2z+JK1ijesGgLjrU+NfGqybiuyvzNs5ODRuJLOYKJhM3i8MGsEJI1ft5pAbcbIzjNE
	6A4eWgX9uiUL5LUGpiWHmL25XklaxSHUgzVCICYK2pbMTbdN1HEUDriNF8PYu61Ri9M4bLzbtFn
	rw5wI7Sk1LrfHkB5xTorY6m5B3Z/mYf8jr+lcwZlArvtsyl9LgNX3JPQBSBZOjfoqBKLrxztEGq
	QEjBbpkTbdqvnYqObXKsr6MNq9byq2ls13Y6R0AJqnRJ0QmzsTzBwkAGbFJbPqGnX+m5ao1A==
X-Received: by 2002:a05:6a00:4b13:b0:847:8dec:141f with SMTP id d2e1a72fcca58-84a672ea3bfmr293017b3a.51.1784067697563;
        Tue, 14 Jul 2026 15:21:37 -0700 (PDT)
Received: from [192.168.0.160] (c-98-225-44-182.hsd1.wa.comcast.net. [98.225.44.182])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a4f238f75sm2119769b3a.9.2026.07.14.15.21.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 15:21:37 -0700 (PDT)
Subject: [PATCH v2 2/4] fixup! drm/nouveau: use
 hmm_range_fault_unlocked_timeout() for SVM faults
From: Stanislav Kinsburskii <skinsburskii@gmail.com>
To: airlied@gmail.com, akhilesh@ee.iitb.ac.in, akpm@linux-foundation.org,
 corbet@lwn.net, dakr@kernel.org, david@kernel.org, jgg@ziepe.ca,
 kees@kernel.org, leon@kernel.org, liam@infradead.org, lizhi.hou@amd.com,
 ljs@kernel.org, lyude@redhat.com, maarten.lankhorst@linux.intel.com,
 mamin506@gmail.com, mhocko@suse.com, mripard@kernel.org,
 nouveau@lists.freedesktop.org, ogabbay@kernel.org, oleg@redhat.com,
 rppt@kernel.org, shuah@kernel.org, simona@ffwll.ch,
 skhan@linuxfoundation.org, skinsburskii@gmail.com, surenb@google.com,
 tzimmermann@suse.de, vbabka@kernel.org
Cc: dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-rdma@vger.kernel.org
Date: Tue, 14 Jul 2026 15:21:35 -0700
Message-ID: <178406769581.1106335.2090301352195900623.stgit@skinsburskii>
In-Reply-To: <178406760622.1106335.2379450382728057793.stgit@skinsburskii>
References: <178406760622.1106335.2379450382728057793.stgit@skinsburskii>
User-Agent: StGit/0.19
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

nouveau_range_fault() now uses hmm_range_fault_unlocked_timeout() for
the HMM fault path. Pass the remaining SVM fault timeout into HMM as a
positive relative timeout instead of open-coding the HMM retry loop in
nouveau.

Keep the outer absolute timeout around nouveau's
mmu_interval_read_retry() loop. HMM's timeout only bounds retries while
HMM is walking and faulting the range. Once HMM returns successfully, a
continuous stream of mmu-notifier invalidations can still make
mmu_interval_read_retry() restart the operation. This path runs from the
GPU fault worker, so fatal signals for the faulting userspace task cannot
be relied on to break that outer loop.

Use time_after_eq() before the HMM call so the remaining timeout passed
to HMM is always positive. This preserves the old timeout behavior at the
expiry boundary and avoids passing 0, which means retry indefinitely, to
hmm_range_fault_unlocked_timeout().

Signed-off-by: Stanislav Kinsburskii <skinsburskii@gmail.com>
---
 drivers/gpu/drm/nouveau/nouveau_svm.c |   14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_svm.c b/drivers/gpu/drm/nouveau/nouveau_svm.c
index 4cfb6eb7c771..58735446d783 100644
--- a/drivers/gpu/drm/nouveau/nouveau_svm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_svm.c
@@ -678,14 +678,20 @@ static int nouveau_range_fault(struct nouveau_svmm *svmm,
 	range.end = notifier->notifier.interval_tree.last + 1;
 
 	while (true) {
-		if (time_after(jiffies, timeout)) {
+		long remaining = timeout - jiffies;
+
+		/*
+		 * The HMM timeout only bounds retries while HMM is walking and
+		 * faulting the range. This fault is handled by a kernel worker,
+		 * so fatal signals from the faulting process cannot stop an
+		 * endless stream of invalidations here.
+		 */
+		if (time_after_eq(jiffies, timeout)) {
 			ret = -EBUSY;
 			goto out;
 		}
 
-		ret = hmm_range_fault_unlocked_timeout(&range,
-						       max(timeout - jiffies,
-							   1L));
+		ret = hmm_range_fault_unlocked_timeout(&range, remaining);
 		if (ret)
 			goto out;
 


