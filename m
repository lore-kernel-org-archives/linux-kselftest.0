Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A28B4393DC7
	for <linux-kselftest@vger.kernel.org>; Sat, 10 Oct 2026 14:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791644273; cv=none; b=HQZ2ghd+3I3li6Q+xJ6BA+AaOy1Uw+zhAZLwjoE3lnq4V9LEHVtmVgrbNRNXqua4G26xYYRCtWdllhsYMZRdlWNHvw+LkqsoShpI4hoeUh96fLkef+R8zmkmwAiHtgCeX6UNyqhSs5AK3aNU+SuG3+tXS00i76aUf98Eh3zNpRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791644273; c=relaxed/simple;
	bh=k1CvlaaDcrOnjg24LRhTZ6lgjvgTD4u9ShDZhtMdy1s=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=GiNKwQkW6BVEZMsy5RQxg57shrnAFd3xKLI4wZzjKROksXXrQ73lWSPBtwTx4frlJHWePbs1pp7U8k9PkuRRUZAKFLCSXL5RxXJHMJ7mM/T09NLpOSr3zaKbwmsnZC5zCfRtC7TPyRaJ5yORrwSS+ygWUlA/u+prJ1Rfzb6E7R0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eJU5Sqqk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bJg7Ztln; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eJU5Sqqk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bJg7Ztln"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69ACUeAb1630215
	for <linux-kselftest@vger.kernel.org>; Sat, 10 Oct 2026 14:57:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/Kh5QG2Nv+X1HzcEjb5yjRQX9s4bFbGm7nM9x0aAKfI=; b=eJU5SqqkkzYTzN4R
	RTgt3AkuTE0sK5ZCxOCuFIcvF63yYaFW2O6J65YEvFFODPC7cC2R6NONvkFrhYae
	uPAuCvA9FpWFAqvAgKTY2ME/g8eVbXgaYaQZ5YAhGpZrBM3g50ZJ4ikj1DSkiVc9
	iUNA06foeyHtgYZfzSPVVKizUKZ7HkjiBMWjPmgte3Gao4vmEnLpBEcbqq0JGx4c
	OWA4Yvn8RYGEseJssN2oK7LcVHxeVOuN6iNWF4A+I8CbJQjt9Tat4P9QGG7CZi/g
	rk+t1SQyPqbRTeMdd3qm4qlloX+nYTij//EuuWUZbDyjoxLkOYnZy8yO7E87g8EI
	tUIXHQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h7cas9dg6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Sat, 10 Oct 2026 14:57:51 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93ae8e7e546so121749185a.1
        for <linux-kselftest@vger.kernel.org>; Sat, 10 Oct 2026 07:57:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791644271; x=1792249071; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/Kh5QG2Nv+X1HzcEjb5yjRQX9s4bFbGm7nM9x0aAKfI=;
        b=bJg7ZtlnUIUN5vgKpVuZ5Yt/+AKoTAcTFF+nIpCQFWj/1cRvGUDeu0aKojO+ItOJVS
         /2jgJ8Oy5sF9B5UDOIDDXjFNbyCzLcwT3peE5Nka64ucosb7ugUS0S4jHq0Vxo+kc+6n
         Qb55Dw2j80Tpn1okMvrNT+S1gm9TroFICr9SQatmos4nTiey9Hx6qocAzJyzgTYDB3hp
         RUh6ATZWlGmVcdl0XvsuXI6O4U1kKFNUlG30n4VLD+YNirdCwNkiJDzEAHXjIludaY4F
         NYGKjZvsjXS29CndXkiT+xWoaVFEoAvNEOeEnXxI4OS1rZar/eyCocyLN7YeoAYNqohx
         tceg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791644271; x=1792249071;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/Kh5QG2Nv+X1HzcEjb5yjRQX9s4bFbGm7nM9x0aAKfI=;
        b=F8I3NdNjYRsOzGW8LxnEA7ZqQHBrgg0+9F5XPRG8FGEINVG0P3Zagznhg7Vzi95jXC
         wPM6ZVATeG5XJQPHeUzNZE+6QrEtmGSNLlDSuiqWkgsoMDtJnKLpDL6x/YD8NgNpERrD
         ovi5toYB9utXzXMnLWcvMiUvRPi2YridslFxROENpWdtbv8NaldNKBfrSZRoVmNU2n7W
         okeOJ1YbtDpUzHQu37RcbyPVBG2JBMBlIjeShnsr3Ywq2/vZj/Kuu66I8R7241rAZ71U
         dkPitBdmfeuU6iNGXIDLfKnsHGz/s1aHoY0bZgw/sOdvgWDgn1GvZ7HrQ8yR3uI1DQCS
         p0wg==
X-Forwarded-Encrypted: i=1; AKwUvBxXPGQHmzXxWftJQ5C0d6kV0bGxY1rIEtfaUeJ4pdpa8QjIFpFzneTWVxBODDhiNzyH6gB83qib7VVUzlAPo2Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYJMfySZgoOhh4iDRV+8Gagdw5g1qh0P+ez5QnSYEbaudnKmsu3I
	JJN8F86h57fT9KvmCocFFL+ydIVbL/HmKJS5S4jti4MSP7AmV8VxryAr1TFv137vmL3l2cZdBrs
	mVpJh2GjTEHiPUFxtUkXo+D+TxStFixIKA1LxFMxOCCNbB02aJ1fYN14G7DuTutqGWHsHjRg=
X-Gm-Gg: AYBFou2R7PxU53MDarTiR/lnC0HDomAaRPL5Hp8dGollz194/bVxgLV2GtpTi0QMKrJ
	cBBUbH0mhZ/1S9rlvqJowyT7dLMyhw/54BWTZxuA7Ai/QdVd1ErmO4YRFWvWS98NR94D5aSsG/U
	g/AB3gL4aHXLtwAAJGeJ06/Je/1gGe5rio6B4qNkKv/j64oy/ceRUtddtBD8j57kYsZK/pr7ZFT
	Hw0VEab6+YMOFW20gciYv9CW3A6o3P0aDd3U4iChQyikLITw3wHqbFFPZN/OqPSQKzgAo3PzICz
	2dtf5bwuNNZXAX23yx2LERuo1NyfxGMGqFuEvDs1axprlB25EBx0/r1/abSzat1Mq+n6Q15+bsg
	ECadRaxnSGSfkT9Fp7q0=
X-Received: by 2002:a05:620a:4007:b0:93e:264:5ad3 with SMTP id af79cd13be357-93ebd25ac2amr840849085a.45.1791644270598;
        Sat, 10 Oct 2026 07:57:50 -0700 (PDT)
X-Received: by 2002:a05:620a:4007:b0:93e:264:5ad3 with SMTP id af79cd13be357-93ebd25ac2amr840846685a.45.1791644270070;
        Sat, 10 Oct 2026 07:57:50 -0700 (PDT)
Received: from [192.168.10.46] ([37.167.89.226])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9acee65sm9641341f8f.49.2026.10.10.07.57.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 10 Oct 2026 07:57:49 -0700 (PDT)
Message-ID: <8e6ddfa3-d94a-4449-b2de-032ca8677d1f@oss.qualcomm.com>
Date: Sat, 10 Oct 2026 16:57:48 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Subject: Re: [PATCH v2 1/6] powercap: Add generic zone hierarchy creation
 helpers
To: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Cc: linux-pm@vger.kernel.org, shuah@kernel.org,
        linux-kselftest@vger.kernel.org, manaf.pallikunhi@oss.qualcomm.com
References: <20260923143416.3713485-1-daniel.lezcano@oss.qualcomm.com>
 <20260923143416.3713485-2-daniel.lezcano@oss.qualcomm.com>
 <CAJZ5v0jikgt4wYS1MJqTBMKBaw=qeuGyD58ArQCoRpZNPZMSSQ@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CAJZ5v0jikgt4wYS1MJqTBMKBaw=qeuGyD58ArQCoRpZNPZMSSQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEwMDA1OSBTYWx0ZWRfX0SS5pDsc6QFj
 YNFUKcFEFO1gFiw4ER7MhqtVqu5SkcpZlBrjx64TICueA5S7NDIMauMT+XA7FT0Z04jAqAicRID
 cGSJLRkuM1F1gHKiscp4L8CT3DDU3bs=
X-Proofpoint-ORIG-GUID: jMW5UTQWh7KAuoQs6TdrvjfQcnq0dbwj
X-Proofpoint-GUID: jMW5UTQWh7KAuoQs6TdrvjfQcnq0dbwj
X-Authority-Analysis: v=2.4 cv=eMWGH3p1 c=1 sm=1 tr=0 ts=6aca526f cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=TGF/BEJusA2u3N3mnVMyRQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=oA7mVUY5bsbhFdn8sccA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEwMDA1OSBTYWx0ZWRfX2Spqh8zAqXYe
 vG+GSmBTiZWTgtp82zA7X1q9HgNmlxJoV/0R4uk3HL3tBBhhQ0aKiOaQOQe1hd9MzjuV7A2IdQ+
 TzwqGHnW1sQPnJcFyfYLW2Dc/+vgRd2mm1KlJjcGcK61l5dEY5gaA5thcj61tETZtgwcsadTf4y
 /QqAlV9nPjMKuRQezfkT8jx86maFmqb2nflljL4CS9Veh16nUTb0lew9U/cOJ5hw9E3KZfFmbPo
 rBnWSd5IwW7GexrYpZEX4tg4JSzfR6Sdc9B2OSOjfd6eJ1jspDeCYZ+B6Tjs6SqSCzf9wc0Q+cf
 n03UttwSHG3eav6qG0AlhFvYzL+rrSGFXMiaYv3b2JDuhPK9iAjGXArQcG2eiBsrTBJ9AMTUuSO
 ZrrEnP5KGIo7DIfi7ugIjrSnC6IlS3S2We8v/X66TmLP4d6Qp+5W76A2k5XfvZWCp6DfWJF+RD1
 agrQq7f0T9k6TN1K/1Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-10_02,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 phishscore=0 clxscore=1015 impostorscore=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610100059


Hi Rafael,

On 9/29/26 20:02, Rafael J. Wysocki (Intel) wrote:
> On Wed, Sep 23, 2026 at 4:34 PM Daniel Lezcano
> <daniel.lezcano@oss.qualcomm.com> wrote:
>>
>> Powercap controllers may need to create several powercap zones organized
>> as a hierarchy. At present, each controller has to open-code the
>> hierarchy traversal, parent lookup, error rollback and reverse-order
>> destruction.
>>
>> Introduce struct powercap_hierarchy to describe a powercap
>> hierarchy. Each node contains its name, parent, backend-specific data
>> and the powercap zone created for it.
>>
>> For example, the following description:
>>
>>    static struct powercap_node nodes[] = {
>>            { .name = "package" },
>>            { .name = "cpu", .parent = &nodes[0] },
>>            { .name = "gpu", .parent = &nodes[0] },
>>    };
>>
>>    static struct powercap_hierarchy hierarchy = {
>>            .nodes = nodes,
>>            .nr_nodes = ARRAY_SIZE(nodes),
>>    };
>>
>> creates the following hierarchy:
>>
>>    package
>>    |-- cpu
>>    `-- gpu
> 
> I gather that this works, but TBH it doesn't look particularly nice,
> especially because of the way in which indices need to be used in it.
> 
> If a few extra bytes can be sacrificed for storing extra pointers,
> something like this can be done instead:
> 
> struct powercap_node {
>      const char *name;
>      struct powercap_node *parent_node;
>      struct powercap_zone *pcap_zone;
>      void *data;
>      unsigned int nr_subnodes;
>      struct powercap_node *subnodes[];
> };
> 
> struct powercap_node cpu_node = {
>      .name = "cpu",
> };
 >
> struct powercap_node gpu_node = {
>      .name = "gpu",
> };
> 
> struct powercap_node package_node = {
>      .name = "package",
>      .nr_subnodes = ARRAY_SIZE(package_node.subnodes),
>      .subnodes[] = { &cpu_node, &gpu_node };
> };


There is another aspect worth considering: the symmetry with the 
existing powercap zone API.

powercap_register_zone() expresses the hierarchy through a parent 
pointer rather than an explicit list of children. The proposed flat 
representation follows the same model, where each node references its 
parent. This is consistent with how powercap zones are registered: a 
zone is attached to an existing parent, without requiring the parent to 
know about its children.

Your suggestion reverses that relationship in the hierarchy description, 
requiring the creation helper to reconstruct the parent pointers during 
traversal. While this works, it introduces a different representation of 
the same hierarchy and makes the description less closely aligned with 
the underlying powercap API.

The parent-based approach also has the advantage that each node can be 
described independently of its siblings. Adding or removing a node only 
requires changing its own entry, without updating the parent's list of 
children or child count. This becomes particularly useful for drivers 
supporting multiple platforms with different topologies, where a single 
array per platform keeps the descriptions compact and easy to maintain.

Moreover, the parent pointer directly represents the relationship needed 
by the registration callback. The hierarchy helper only needs to resolve 
the parent's registered zone and pass it to the callback, without 
maintaining an explicit child list.

I agree that referencing parents through array indices is not 
particularly elegant and that the ordering constraint is a limitation of 
the current implementation. However, these are traversal and 
representation details that could be improved independently, without 
necessarily changing the parent-based model.

For these reasons, I think preserving the symmetry with the existing 
powercap API, along with the simplicity and scalability of platform 
descriptions, is worth considering.

[ ... ]
