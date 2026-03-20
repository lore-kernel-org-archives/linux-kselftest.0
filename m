Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 425D02FCC0E
	for <linux-kselftest@vger.kernel.org>; Fri, 20 Mar 2026 18:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774032030; cv=none; b=q0GitpyVM9wXHx/en4MDV0tiJdHXScBpgBM9zZq94wlxjqej3kVP59X6+5ksY459YqrkAVV9NOZVHBGWv6R8/tPwus01+MLYn1cpzo22SDrdCDzLLmgQ4mWieLLnKHR9Jq/UWblDK5xOy//u3TsNZbkZZrm3fpSTyNF2QP/b8P4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774032030; c=relaxed/simple;
	bh=zZPAOWgtG4SQHr42CzCQhbcxIcm4NV2vph/WXhLwsYo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jKwH3/VcSMfKVdbiMbix0SY1Ka9QmUH7QORQn57mQhBgQ1q2zJv3iAEuktY9rI+aln9/3037OdchfSwwT9ZZnT6wCmLgDHnV77qbI2U4fMoMjvLh4r3xZ9bZGBXxCYdRTzOT1QV7vU73FaXxXXN9wun+ryb7Y9m/BVjfem4BBkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KkmEgLnv; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KkmEgLnv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774032028;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zZPAOWgtG4SQHr42CzCQhbcxIcm4NV2vph/WXhLwsYo=;
	b=KkmEgLnvg0tcVtLTt9MGYIO9mshD1AhyMsXbymss90GQOgQkg92cSWZz/PSFCdqMt/MuRI
	+//wSgkFtSQWGE4oM0+10yrqUOlRwC5SROVfuMMZRSom2firKVZD9caSB2VsN2que+Ha03
	3t3gpZJZ4UYu9q/RDlQrEiFAIPpwgvk=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-629-HeHuosOpNrOq6Tg3VFKqRA-1; Fri,
 20 Mar 2026 14:40:21 -0400
X-MC-Unique: HeHuosOpNrOq6Tg3VFKqRA-1
X-Mimecast-MFC-AGG-ID: HeHuosOpNrOq6Tg3VFKqRA_1774032017
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id AF779180034E;
	Fri, 20 Mar 2026 18:40:16 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.22.80.202])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 48FE01953944;
	Fri, 20 Mar 2026 18:40:14 +0000 (UTC)
From: Audra Mitchell <audra@redhat.com>
To: akpm@linux-foundation.org
Cc: david@kernel.org,
	ljs@kernel.org,
	Liam.Howlett@oracle.com,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	shuah@kernel.org,
	usama.anjum@collabora.com,
	colin.i.king@gmail.com,
	avagin@google.com,
	linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V2] selftests/mm: Fix soft-dirty kselftest supported check 
Date: Fri, 20 Mar 2026 14:39:14 -0400
Message-ID: <20260320184010.759461-1-audra@redhat.com>
In-Reply-To: <f7fef55d-4334-4d1d-b6c6-b409fea7e2a1@kernel.org>
References: <f7fef55d-4334-4d1d-b6c6-b409fea7e2a1@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

Sending V2:

Changes are:
1. Cleared up commit message
2. Adjusted the patch to reflect David's recommendations

