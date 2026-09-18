Received: from mx0a-002e3701.pphosted.com (mx0a-002e3701.pphosted.com [148.163.147.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D07533D512;
	Fri, 18 Sep 2026 16:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.147.86
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789747482; cv=none; b=NwYFaXNwQr079cHx8TQOTwOLsg65G9ROITATDufOdmytga3A5GbERwE1HixuEpZCio40kQzl2qk1FZo3E09Pib61pTkZLNWeR9/PpTmH+Fj0cxznwJMRgNo1y6zcTHz5IojfYHtE1tsLF00D9Sfcl7nqm67UJULtpXa1yJhvVQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789747482; c=relaxed/simple;
	bh=51g3UiLKuZWC9PyMufAfpqPt9Y6edxCPWQ0wUSLjpJ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QhH3JiFkuz7UCt1hRumKICGxw558I97F8viecK1ahFnpJAXdyqw/mB/F52dJEVdF3IsN57vnPHUiWLTLsem1tFogCybljqVgAdvlcu1szuUcOtJdgHd1GUf6ElNeV7j+lqwpQW0DPD73tPNldWQ4yHp5/L28vlI3O83ZrwrSWao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com; spf=pass smtp.mailfrom=hpe.com; dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b=IHfsqH0i; arc=none smtp.client-ip=148.163.147.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hpe.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b="IHfsqH0i"
Received: from pps.filterd (m0148663.ppops.net [127.0.0.1])
	by mx0a-002e3701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68IDNBXQ515911;
	Fri, 18 Sep 2026 16:03:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pps0720; bh=uc4FCppFKvSYMEFUJD+GdMcIgx
	fJPxqNRU0X+NKpVX8=; b=IHfsqH0ij+X+9h6dvxnKG+ln+4UgfkXSOrbSG2AMVN
	3sAGXfDLckP+TodrXje4alDDMWqYZuWX9mY2/kKVIQNp8Lf7gvusxAbtarGjP7e3
	nE46s84zQGcdMeD0F+i9pODg/yXV0R6XK5FaZbeuQDPNTf4F7gI/v4J/i5UIyInj
	+zMM88w2fFRPSSTCkHdKcJCP25XMHdWw3GtwcqY9tQqPsMnsteWLS043RECtiu7+
	9dT3MLQlm6zj3ihi3vAxuPSRHxj+ZTGXkiJZb5qTE6R3CVXbfbH/FM0/0gaYCDKE
	odEEvTaWp4+bJik5jc7FoNK7I5XHRwE/YruFWbpr+img==
Received: from p1lg14878.it.hpe.com (p1lg14878.it.hpe.com [16.230.97.204])
	by mx0a-002e3701.pphosted.com (PPS) with ESMTPS id 4gs4bkbj1q-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 18 Sep 2026 16:03:12 +0000 (GMT)
Received: from p1lg14886.dc01.its.hpecorp.net (unknown [10.119.18.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by p1lg14878.it.hpe.com (Postfix) with ESMTPS id 2BE6DD2E3;
	Fri, 18 Sep 2026 16:03:10 +0000 (UTC)
Received: from HPE-5CG20646DK.localdomain (unknown [16.231.227.36])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by p1lg14886.dc01.its.hpecorp.net (Postfix) with ESMTPS id E6C9280AA61;
	Fri, 18 Sep 2026 16:03:04 +0000 (UTC)
Date: Fri, 18 Sep 2026 11:03:00 -0500
From: Kyle Meyer <kyle.meyer@hpe.com>
To: Michal Hocko <mhocko@suse.com>,
        "David Hildenbrand (Arm)" <david@kernel.org>
Cc: akpm@linux-foundation.org, corbet@lwn.net, linmiaohe@huawei.com,
        shuah@kernel.org, tony.luck@intel.com, jane.chu@oracle.com,
        jiaqiyan@google.com, Liam.Howlett@oracle.com, bp@alien8.de,
        hannes@cmpxchg.org, jack@suse.cz, joel.granados@kernel.org,
        laoar.shao@gmail.com, lorenzo.stoakes@oracle.com,
        mclapinski@google.com, nao.horiguchi@gmail.com, osalvador@suse.de,
        rafael.j.wysocki@intel.com, rppt@kernel.org, russ.anderson@hpe.com,
        shawn.fan@intel.com, surenb@google.com, vbabka@suse.cz,
        linux-acpi@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
        linux-mm@kvack.org
Subject: Re: [PATCH v3] mm/memory-failure: Support disabling soft offline for
 HugeTLB pages
Message-ID: <aq1gtOOUqU1-RJJu@hpe.com>
References: <aqiIEkrc6aDBOqRg@hpe.com>
 <aqkCbgHmMGxI_GLG@tiehlicka>
 <aqmGd0GGUCkbZpkZ@hpe.com>
 <aqpYxAktjexhaMGc@tiehlicka>
 <ad36cd54-7319-4bb4-bf8f-9fcc7b009158@kernel.org>
 <aqqXbwglwYTyTuUG@tiehlicka>
 <36480c86-fc59-4387-91a4-cad839f502f2@kernel.org>
 <aqqdlndHq9vHeX8s@tiehlicka>
 <67b63b36-82c9-45d4-8dd3-1bec2823a123@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <67b63b36-82c9-45d4-8dd3-1bec2823a123@kernel.org>
X-Proofpoint-GUID: L_WdTr3DFK_IidRpPlCXthNiuHl9BS72
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDIyOSBTYWx0ZWRfX6ClIMWsv6mB4
 0IlWT184tZaynkzSZIDoNoAERHmTUSCeSWT2G9DqDmAPWikkEJHU7Z+OCK8WjidX8Tiyh8hpvlw
 lKCwvXrpUS4ES7gMjdNHX3dLER0LLD4=
X-Authority-Analysis: v=2.4 cv=EvhHPicA c=1 sm=1 tr=0 ts=6aad60c0 cx=c_pps
 a=UObrlqRbTUrrdMEdGJ+KZA==:117 a=UObrlqRbTUrrdMEdGJ+KZA==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=gQcMVamqm3wCPoSYhaRC:22 a=6_mrDcixewTG61oOsKN3:22 a=RfWlH6W0a2UdQScw0pgA:9
 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: L_WdTr3DFK_IidRpPlCXthNiuHl9BS72
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDIyOSBTYWx0ZWRfX3Q0UtYojvFKu
 3/JDEpX/5OkGU3VRG+md1cX5CgLjCC94TPLncGqJLs73047ibKMKLQPBDZ5i/WqWvhAkdWbnn/W
 ZVEppZupoRXP1uUhtBcyQnOhEnhotct8Wgu+2kew7fd+WS627izPZKIkFIvXRhUx+JHE6SM0CPj
 uSdlHm/QaKrlX23yGf2d7hQW6mu/x6TOkwGOOhw3AeYC3NQZPNbEbGdIpR84ISXLxLfqtqGWubo
 XIeEycNeUpkkOsXfYZbkL4KBKH7y/UH+3D0btomS9BAXq7sYko+BxUHc+ieZdkyIJgApL/W6Ssd
 2sug4u2chH3zdAP2QKIZpQLTW7DMqM+Riuo36V3c38q2lhelThRXpensQbEUaM9bUYC6l9pPetd
 N2/N4mA+n5OydnDCvJjB9m0CSrUFBvwPOti+oQ9RtzHfUCjERQeo1Xddenp9+Z0UqUSXay7BFjM
 DRiMhlch8smkwEXvt8A==
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180229

On Wed, Sep 16, 2026 at 04:30:46PM +0200, David Hildenbrand (Arm) wrote:
> On 9/16/26 15:45, Michal Hocko wrote:
> > On Wed 16-09-26 15:28:01, David Hildenbrand wrote:
> >> On 9/16/26 15:19, Michal Hocko wrote:
> >>>
> >>> Yes, no dispute on that. But we have HW poisoning for exactly that
> >>> purpose, no?
> >>
> >> Well, that tells you that the page content is effectively gone and should be
> >> tried to be recovered / migrated away. Unless I am messing up terminology here.
> > 
> > Maybe it is me messing up the terminology...
> > But I guess we have established that whether soft offlining is being
> > abused or not, excluding hugetlb through a configuration is just a wrong
> > thing to do.
> 
> Yes, it's odd that you wouldn't want to evacuate hugetlb but everything else.

Thanks for the feedback, Michal and David.

I'll drop this series.

It sounds like the consensus is to keep soft offline behavior the same across
page types.

Thanks,
Kyle Meyer
