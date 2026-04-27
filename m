Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE9E13396F4
	for <linux-kselftest@vger.kernel.org>; Mon, 27 Apr 2026 16:04:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777305849; cv=none; b=EMPq9NExyATV+fsVuRw9ypL43MVHNKXTbHHA+ib/ue7zz/UN/biimMR5gxTOKvi7BBTfHJLhYrj/uJIT4wnQW5WJ7DtSZDuU7h1kAhe8PHFCc1WQaKluplxqbGKwF/1agB0Qg2dimyd8ud6Drklr6O2MCpaYsphFaqXDZjIvZZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777305849; c=relaxed/simple;
	bh=ydXHDbA23nlDpQ3nMlm3NWaN0ysulU/aADBaJq8dS08=;
	h=Message-ID:Date:MIME-Version:From:To:Subject:Cc:Content-Type; b=o4QnmkSpFWsAc7PuJn3b48f5QfCY5QSVmWdme5MRfuzise6Nbs/PtAgsNpZL7OAslvILPLukYqquT6zWnlWBl1bUS9OvJ1Ee2KoXgrUi7gVyJeizwW0lo12zjD4VRxbbP0fg9fZm32McumYw8cAecSUaoSFCqMzy/13Lq3tj8xc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=En43amU2; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="En43amU2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1777305847;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=yljwN6KCpoZ9u8ZPW4Plzy1QSibJM6+pSoXgDh3CAaY=;
	b=En43amU2WLER3NtZalpiPI8C1aD9kQ3LUPtTHiAw4NcqikjG7m4g3I81AclUhSIVEGoXJM
	JJIemLjxhpQYY0DTFxu31zCjPisy46NP7XF3f0Qw4VqFJmrBePkP1Qa1igBHCRTHJCzqf8
	hTU8kI6MNLlVyELGsU4NAzSA1vKTDhk=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-639-kznsBgB0M-OqOikWiSRE4Q-1; Mon, 27 Apr 2026 12:04:04 -0400
X-MC-Unique: kznsBgB0M-OqOikWiSRE4Q-1
X-Mimecast-MFC-AGG-ID: kznsBgB0M-OqOikWiSRE4Q_1777305844
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8aca3b7b536so262534606d6.3
        for <linux-kselftest@vger.kernel.org>; Mon, 27 Apr 2026 09:04:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777305844; x=1777910644;
        h=content-transfer-encoding:cc:subject:to:from:content-language
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yljwN6KCpoZ9u8ZPW4Plzy1QSibJM6+pSoXgDh3CAaY=;
        b=Fn+F7cgwBMujxzQ4ee9xUeXsseyOm/06FlhqoJFH9MhT5yZLwpsLbzn+DcQAtrzuf2
         e4vV7OJQXZtErm/BbIJ6BzySPDxZ+xqY25+rlTk3bVbyykru77cEyrj9Abr5vqNKnY8V
         e/HGJw9N7OUDBCIZem+2u7UGnAVg+tH2nav8rdQ0TBOseRhih1KhTjkYXOAgzU76RVff
         xgNDEY+0TCEG5HQbRaruT2k+gjyqv8Hw3tepAlO1s4vUalws/TuB41nDpY/QxE+eBYiL
         2pgfSCTnTxgJPRuoIKFtkZEWPKhCUZnvmwDJKPwKB84SExJoztR674In1PTeOAM/wye4
         MOJA==
X-Forwarded-Encrypted: i=1; AFNElJ+rqSgf/bSq0Scq7lequk9Vx29Cw8jbOjQArSDgh+BE3mfcKPW7qUzV82J7UrZ/5RBU2M0+iZIIvFwA6THzzwI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwhRPZexPlsQM5d2QIlOvynhTK2uYWAXphHDv8MKWDFiHlhaj2a
	C2WfENeRE7oy+poDQe6oIB5rbvWRdmUU3msqRAqzhRYKyO9grE4NEpYFVa07pV8NXaGiWo7Nby1
	BwHGFNtEtJysBitJ6qmrTZXkEn1B3aF0mawLaJffwcSXsAzpD/zO0hIDUmP0bgHBoCCyGHQ==
X-Gm-Gg: AeBDietH06bIIuE4gCoFSzY4uJpErPpMF5QDkEnUNrcEj8sJ7iid7Zxkz+JbJm6K5yY
	QqlcYQ/qYsR7cnoFMgQgcDzMjoVLJ3c7joZbM8n9nw0wK6aSAwPx/hXLvhxwRhwBE+y5DEB+FSE
	IKGsunGBH4sa6GqI3xtqZ4sgIOMx6Kv7kb8wV2s5H7WQJxnFr3andtan2uLCM73wRZD9piPp+HX
	MyuOALEEwFvw9fU3XAd7fsh1PrvRYtfZ7OSbA6Nx4A/sIt8HaoVxMwK0yp61s7qPfULVPGHS14G
	onuulMSwIu/VLIgXoOoloCMWYM59K+cbV8Q2CuHL6Zpdntz0AYcMK2MGvxhbuEItdMCl4IwJncm
	SQqm8HX9dzOe/+262p5UQYcsPC9zSiIeo21JX
X-Received: by 2002:a05:622a:1650:b0:50b:41bf:4ee5 with SMTP id d75a77b69052e-50e36f1b3cdmr659161211cf.57.1777305843830;
        Mon, 27 Apr 2026 09:04:03 -0700 (PDT)
X-Received: by 2002:a05:622a:1650:b0:50b:41bf:4ee5 with SMTP id d75a77b69052e-50e36f1b3cdmr659160301cf.57.1777305843219;
        Mon, 27 Apr 2026 09:04:03 -0700 (PDT)
Received: from [192.168.2.110] ([69.159.169.238])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50e392c859asm338056491cf.1.2026.04.27.09.04.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Apr 2026 09:04:02 -0700 (PDT)
Message-ID: <214fd9e4-5398-4c26-859e-c982c2e277c3@redhat.com>
Date: Mon, 27 Apr 2026 12:03:51 -0400
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US, en-CA
From: Luiz Capitulino <luizcap@redhat.com>
To: Linux Memory Management List <linux-mm@kvack.org>,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>
Subject: [PATCH] selftests/mm: run_vmtests.sh: fix destructive tests
 invocation
Cc: "David Hildenbrand (Red Hat)" <david@kernel.org>,
 Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett"
 <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Shuah Khan <shuah@kernel.org>, linux-kselftest@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Destructive tests should be invocated with -d command-line option, but
this won't work today since 'd' is missing in getopts command-line. This
commit fixes it.

Signed-off-by: Luiz Capitulino <luizcap@redhat.com>
---
Mike,

Maybe it's a good idea to add this patch to your series since the
hugetlb-read-hwpoison selftest won't work without your fix.

  tools/testing/selftests/mm/run_vmtests.sh | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/mm/run_vmtests.sh b/tools/testing/selftests/mm/run_vmtests.sh
index d8468451b3a3..c17b133a81d2 100755
--- a/tools/testing/selftests/mm/run_vmtests.sh
+++ b/tools/testing/selftests/mm/run_vmtests.sh
@@ -103,7 +103,7 @@ RUN_ALL=false
  RUN_DESTRUCTIVE=false
  TAP_PREFIX="# "
  
-while getopts "aht:n" OPT; do
+while getopts "aht:nd" OPT; do
  	case ${OPT} in
  		"a") RUN_ALL=true ;;
  		"h") usage ;;
-- 
2.53.0

