From: daniel@iogearbox.net (Daniel Borkmann)
Date: Thu, 11 Apr 2019 23:24:55 +0200
Subject: [PATCH v3 bpf-next 2/4] bpf: add layer 2 encap support to
 bpf_skb_adjust_room
In-Reply-To: <CAF=yD-LMZF2gU+AmKSgtzN3YDDiO=XF19kf7RNg5_8zNp2m93w@mail.gmail.com>
References: <1554818803-4070-1-git-send-email-alan.maguire@oracle.com>
 <1554818803-4070-3-git-send-email-alan.maguire@oracle.com>
 <12f9cef4-f5ff-78a4-ec0f-42f737696735@iogearbox.net>
 <CAF=yD-LMZF2gU+AmKSgtzN3YDDiO=XF19kf7RNg5_8zNp2m93w@mail.gmail.com>
Message-ID: <a71ff9c0-c7d6-005d-2776-6633273f0183@iogearbox.net>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190411212455.QV30cFER-4basCFLhYVZtqV-482NvJR_Xr4j2gySgP0@z>

On 04/11/2019 11:18 PM, Willem de Bruijn wrote:
[...]
>>> diff --git a/net/core/filter.c b/net/core/filter.c
>>> index 22eb2ed..a1654ef62 100644
>>> --- a/net/core/filter.c
>>> +++ b/net/core/filter.c
>>> @@ -2969,11 +2969,14 @@ static u32 bpf_skb_net_base_len(const struct sk_buff *skb)
>>>  #define BPF_F_ADJ_ROOM_MASK          (BPF_F_ADJ_ROOM_FIXED_GSO | \
>>>                                        BPF_F_ADJ_ROOM_ENCAP_L3_MASK | \
>>>                                        BPF_F_ADJ_ROOM_ENCAP_L4_GRE | \
>>> -                                      BPF_F_ADJ_ROOM_ENCAP_L4_UDP)
>>> +                                      BPF_F_ADJ_ROOM_ENCAP_L4_UDP | \
>>> +                                      BPF_F_ADJ_ROOM_ENCAP_L2( \
>>> +                                       BPF_ADJ_ROOM_ENCAP_L2_MASK))
>>>
>>>  static int bpf_skb_net_grow(struct sk_buff *skb, u32 off, u32 len_diff,
>>>                           u64 flags)
>>>  {
>>
>> One thing that it seems missing in this but also in Willem's earlier set
>> is that we reject these flags in bpf_skb_net_shrink(). Both are called from
>> bpf_skb_adjust_room(), so if we don't support decap yet we should reject
>> such flags so we can extend in future. Could you or Willem send a follow-up?
> 
> Indeed. Thanks for bringing that up, Daniel. I only thought of that
> after submitting the original patchset, too. Will send a patch.

Great, thanks, appreciated! :)
