Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78A8549482A
	for <linux-kselftest@vger.kernel.org>; Tue,  1 Sep 2026 18:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788286046; cv=none; b=nK2L0+pN64LIMRffIEXc2i30TeG3bQPwkKwTou6jD1fJtOpHYBREyeq5HQ0hio2fZbUEJdTiDoj6hj7s90ynL3mTWXkKtvaO9DgGEwSAZ7ypLDeFHIB9HfwBbL7a470Rc1HDmoBIwKMKs3WEVlhZBsxFpCXHYwC4QQ3GgedbXq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788286046; c=relaxed/simple;
	bh=XOoPuVLt9dfHQzyitxIiDLxWCT1LNGdaieF2sHtluzo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=BBLWXccbgCf9oiLkhqD8m63kUFgjerW2YlL0sL9h50m3/MY1Ionb7vRKrHnNZdWMoftB+OKP1NqcHH3RJRpsoHJdnxec2hUE2MlgDfBOXXDRkKN0lrJbDHVhWGjTaz9ehKi6Hr64lLdgveHRf9dTWEx25i5D7RkKSqDRQGWgXp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DpdgKFjN; arc=none smtp.client-ip=209.85.215.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DpdgKFjN"
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc1cdfb337eso216957a12.0
        for <linux-kselftest@vger.kernel.org>; Tue, 01 Sep 2026 11:07:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788286045; x=1788890845; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j3UHjUhSHEFs3BDPKTwtfBJ57unvd2KtLqU4zpNQnvE=;
        b=DpdgKFjNRLihw6sTldhn+GUTyzKoBYEhWDaeC8k/8Nvmj/CRn94BSsWxZ91NDJXqzq
         66DaDhO/jl2XXSED3dG1jCWLDSwVFsNFq1Z4LW+xbs0OrszMqFpxQGwOfZ62p8zD+nmK
         fr+WRWM/y+IiVDRqJNiWN6TUwq0+bdD3o6HmLODW7ZHAK8uVn0B2ZWKt5QYzedFptgB3
         H/km0RrgN4fxxjIYuea8fqeYlPvovA7uV7B2r0eQNlSM7W7L5LfR5iYVYE2HdKgfRVpX
         t4Bdytr+kW0CGjsbYVnadSs41qeCLADhg97zLXJ5Z3vqDK/LwvCNIMsoJ+vLMevFAMoe
         D80A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788286045; x=1788890845;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j3UHjUhSHEFs3BDPKTwtfBJ57unvd2KtLqU4zpNQnvE=;
        b=h1jGdWXnOTxiIA6CJsnQR4OPj5Cf0oDTRHCWp9zvITrJr/EgstQe2A/UTK3hEIPGWF
         jN57VJNP2yfE78LemobECvru0ar7pu0/sGCX4mENMCSPDcLJLirHLF0F42KZngH4ygIF
         B2NW1RzXerTxuzqeleNmacPekTzE3lnJ0ZNQIMO7uZv7AcKMCZM9DDqDkZ04A1FKAPCw
         +wPi9F6fEofTjgshAucgmRMrm041ssrz0NgIj4p94xTrqT8uaMcLSOc/kYFNyPWkPi4b
         9pKx5hV9XeHCgyICJh0DPBEPY59v7SLdYgqtoAvcZYmXORg5AMTQOht6qmt/FxOKx52w
         uq2Q==
X-Forwarded-Encrypted: i=1; AHgh+Rqs1LUz0hBWlA8kignoKtBrdabF13t2e+5GwmkWS3MbnSIOLTZP9XJdMBoJZDzpBk6JM+CWx1nqZo1kGt0TeuI=@vger.kernel.org
X-Gm-Message-State: AFuF++kBauExldmuIZqJlrm5gu/ZT2KKyTyU3h5JQYsyZ5kyucbz7Lli
	gX5/sahlXU9dE6OkP8ulQNyqqFASx6S4WF30VGujNSBBqJ57Z4s3LheivLxzbIgS2q7B6JgiAJ6
	UMMU4iio807iQow==
X-Received: from pgp10-n2.prod.google.com ([2002:a05:6a02:62ca:20b0:cc2:2955:6540])
 (user=dmatlack job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a21:7a97:b0:3d0:cc29:ff64 with SMTP id adf61e73a8af0-3d7af8303a1mr17251598637.15.1788286044618;
 Tue, 01 Sep 2026 11:07:24 -0700 (PDT)
Date: Tue,  1 Sep 2026 18:07:09 +0000
In-Reply-To: <20260901180713.4185641-1-dmatlack@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260901180713.4185641-1-dmatlack@google.com>
X-Mailer: git-send-email 2.55.0.966.g6673acef38-goog
Message-ID: <20260901180713.4185641-2-dmatlack@google.com>
Subject: [RFC PATCH 1/5] liveupdate: Extract luo_file token lookup logic into
 helper function
From: David Matlack <dmatlack@google.com>
To: kexec@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org
Cc: Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, Pratyush Yadav <pratyush@kernel.org>, 
	Samiullah Khawaja <skhawaja@google.com>, Shuah Khan <shuah@kernel.org>, 
	David Matlack <dmatlack@google.com>
Content-Type: text/plain; charset="UTF-8"

Extract the token-based list iteration inside luo_retrieve_file() into a
standalone private helper luo_find_file_by_token().

This eliminates code duplication by paving the way for additional file
retrieval modalities (like retrieving into an existing file descriptor)
which also need to safely lookup file tracking structures from the token
list before bridging payloads.

No functional change intended.

Signed-off-by: David Matlack <dmatlack@google.com>
---
 kernel/liveupdate/luo_file.c | 30 ++++++++++++++++++------------
 1 file changed, 18 insertions(+), 12 deletions(-)

diff --git a/kernel/liveupdate/luo_file.c b/kernel/liveupdate/luo_file.c
index c39f96961a85..5e160836a165 100644
--- a/kernel/liveupdate/luo_file.c
+++ b/kernel/liveupdate/luo_file.c
@@ -549,26 +549,32 @@ void luo_file_unfreeze(struct luo_file_set *file_set,
  *         -ENOENT if no file with the matching token is found.
  *         Any error code returned by the handler's .retrieve() op.
  */
-int luo_retrieve_file(struct luo_file_set *file_set, u64 token,
-		      struct file **filep)
+
+static struct luo_file *luo_find_file_by_token(struct luo_file_set *file_set, u64 token)
 {
-	struct liveupdate_file_op_args args = {0};
 	struct luo_file *luo_file;
-	bool found = false;
-	int err;
 
 	if (list_empty(&file_set->files_list))
-		return -ENOENT;
+		return ERR_PTR(-ENOENT);
 
 	list_for_each_entry(luo_file, &file_set->files_list, list) {
-		if (luo_file->token == token) {
-			found = true;
-			break;
-		}
+		if (luo_file->token == token)
+			return luo_file;
 	}
 
-	if (!found)
-		return -ENOENT;
+	return ERR_PTR(-ENOENT);
+}
+
+int luo_retrieve_file(struct luo_file_set *file_set, u64 token,
+		      struct file **filep)
+{
+	struct liveupdate_file_op_args args = {0};
+	struct luo_file *luo_file;
+	int err;
+
+	luo_file = luo_find_file_by_token(file_set, token);
+	if (IS_ERR(luo_file))
+		return PTR_ERR(luo_file);
 
 	guard(mutex)(&luo_file->mutex);
 	if (luo_file->retrieve_status < 0) {
-- 
2.55.0.966.g6673acef38-goog

