Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3ED835B623
	for <linux-kselftest@vger.kernel.org>; Thu, 12 Feb 2026 12:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770900591; cv=none; b=lIMkd81Hh0ZtHJv+6t0pW/GVJ0NiYSqXUjslLdmdme14CawDVvx0mXk4AXZHD8SW1PJWSO3tZl4CYE6rJBxDbP6eCooOG+7MLxXEM2eE54rQvzTxxidH32hTUUwfFnmRJ9+Z4mkqbOEdU1h4+6aI9XegPY1e7slRXwo5aBMo5k4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770900591; c=relaxed/simple;
	bh=p/tbXoO5thb1nTi6kW+oVg6SjxAlvLFhd9eofC77fKM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=feHawtIn56/otptd579PPaWYPqKI0wIgrRoJ91CvzABDPMfmEPWHDdQ5Gfire4TTrCsuL2Y6fizmUHw4PsVCasQvOSem9UDBL/zOHhKDmNDx8NHW+JCdDULJa9LFCTzosmkDZlb511lyQF/XMe08xOudyfnFC/3MPb5Je757pQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RlXVmIxJ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RlXVmIxJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1770900588;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7YM719y7E+mTkz8X3h+0EF62k2rhu1PY3VU/uXfzYDg=;
	b=RlXVmIxJI2yNch+XfaUC7LO1cSqhwbJg7zf+v9JRVKu9fe8CeTeZRaFi+wh0O5id3I0Qsk
	nsGC24slxLC9zwISG1eCuuAGlFlxoJheplBwkB6VFGkgZZSdRdQvDl7byx7XEZBKeJp7fo
	ALDeChoKU2/0ATtkrbv9vuQcuyT2Isc=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-602-pIi6mzgSOEWpbxei4jKU1g-1; Thu,
 12 Feb 2026 07:49:45 -0500
X-MC-Unique: pIi6mzgSOEWpbxei4jKU1g-1
X-Mimecast-MFC-AGG-ID: pIi6mzgSOEWpbxei4jKU1g_1770900583
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 443481955E88;
	Thu, 12 Feb 2026 12:49:43 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.44.22.11])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 7F8F430001BB;
	Thu, 12 Feb 2026 12:49:37 +0000 (UTC)
From: Gabriele Paoloni <gpaoloni@redhat.com>
To: corbet@lwn.net,
	skhan@linuxfoundation.org,
	arnd@arndb.de,
	gregkh@linuxfoundation.org,
	brendan.higgins@linux.dev,
	raemoar63@gmail.com,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	kunit-dev@googlegroups.com
Cc: acarminati@nvidia.com,
	linux-mm@kvack.org,
	safety-architecture@lists.elisa.tech,
	kstewart@linuxfoundation.org,
	chuckwolber@gmail.com,
	gpaoloni@redhat.com
Subject: [RFC PATCH v3 1/6] Documentation: extend the 'Function documentation' with expected behavior and constraints of use
Date: Thu, 12 Feb 2026 13:49:18 +0100
Message-ID: <20260212124923.222484-2-gpaoloni@redhat.com>
In-Reply-To: <20260212124923.222484-1-gpaoloni@redhat.com>
References: <20260212124923.222484-1-gpaoloni@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

Extend the longer description section of a function kernel-doc
header with an itemised list of function's behaviors and
constraints of use.
These are useful to link and trace test cases (e.g. KUnit) to
the different behavior IDs and define the constraints to be
met by the function's caller.

Signed-off-by: Gabriele Paoloni <gpaoloni@redhat.com>
---
 Documentation/doc-guide/kernel-doc.rst | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/Documentation/doc-guide/kernel-doc.rst b/Documentation/doc-guide/kernel-doc.rst
index 8d2c09fb36e4..23e6c4b45b14 100644
--- a/Documentation/doc-guide/kernel-doc.rst
+++ b/Documentation/doc-guide/kernel-doc.rst
@@ -83,6 +83,25 @@ The general format of a function and function-like macro kernel-doc comment is::
    *
    * The longer description may have multiple paragraphs.
    *
+   * When specifying testable code behaviour the longer description must contain
+   * a paragraph formatted as follows:
+   *
+   * function_name behavior:
+   * [ID1] - [expected behavior]
+   *
+   * [ID2] - [expected behavior]
+   *
+   * [...]
+   *
+   * [IDn] - [expected behavior]
+   *
+   * function_name constraints of use:
+   * [ID1] - [constraint to be met by the caller]
+   *
+   * [ID2] - [constraint to be met by the caller]
+   *
+   * [IDn] - [constraint to be met by the caller]
+   *
    * Context: Describes whether the function can sleep, what locks it takes,
    *          releases, or expects to be held. It can extend over multiple
    *          lines.
-- 
2.48.1

