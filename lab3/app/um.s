
uMain.elf:     file format elf32-i386


Disassembly of section .text:

00000000 <uEntry>:
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	53                   	push   %ebx
   4:	52                   	push   %edx
   5:	e8 3a 04 00 00       	call   444 <fork>
   a:	ba ff 07 00 00       	mov    $0x7ff,%edx
   f:	31 db                	xor    %ebx,%ebx
  11:	31 c9                	xor    %ecx,%ecx
  13:	eb 07                	jmp    1c <uEntry+0x1c>
  15:	8d 76 00             	lea    0x0(%esi),%esi
  18:	43                   	inc    %ebx
  19:	4a                   	dec    %edx
  1a:	74 08                	je     24 <uEntry+0x24>
  1c:	85 c0                	test   %eax,%eax
  1e:	74 f8                	je     18 <uEntry+0x18>
  20:	41                   	inc    %ecx
  21:	4a                   	dec    %edx
  22:	75 f8                	jne    1c <uEntry+0x1c>
  24:	50                   	push   %eax
  25:	53                   	push   %ebx
  26:	51                   	push   %ecx
  27:	68 94 04 00 00       	push   $0x494
  2c:	e8 6b 01 00 00       	call   19c <printf>
  31:	83 c4 10             	add    $0x10,%esp
  34:	eb fe                	jmp    34 <uEntry+0x34>
  36:	66 90                	xchg   %ax,%ax

00000038 <itoa>:
  38:	55                   	push   %ebp
  39:	89 e5                	mov    %esp,%ebp
  3b:	57                   	push   %edi
  3c:	56                   	push   %esi
  3d:	53                   	push   %ebx
  3e:	83 ec 14             	sub    $0x14,%esp
  41:	89 d3                	mov    %edx,%ebx
  43:	89 4d e0             	mov    %ecx,-0x20(%ebp)
  46:	85 c0                	test   %eax,%eax
  48:	74 6e                	je     b8 <itoa+0x80>
  4a:	3d 00 00 00 80       	cmp    $0x80000000,%eax
  4f:	74 7b                	je     cc <itoa+0x94>
  51:	8d 7d e4             	lea    -0x1c(%ebp),%edi
  54:	be a8 04 00 00       	mov    $0x4a8,%esi
  59:	b9 04 00 00 00       	mov    $0x4,%ecx
  5e:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  60:	85 c0                	test   %eax,%eax
  62:	0f 88 94 00 00 00    	js     fc <itoa+0xc4>
  68:	c6 02 00             	movb   $0x0,(%edx)
  6b:	0f 84 9c 00 00 00    	je     10d <itoa+0xd5>
  71:	31 f6                	xor    %esi,%esi
  73:	31 c9                	xor    %ecx,%ecx
  75:	8d 76 00             	lea    0x0(%esi),%esi
  78:	99                   	cltd   
  79:	f7 7d e0             	idivl  -0x20(%ebp)
  7c:	8a 54 15 e4          	mov    -0x1c(%ebp,%edx,1),%dl
  80:	88 14 33             	mov    %dl,(%ebx,%esi,1)
  83:	46                   	inc    %esi
  84:	85 c0                	test   %eax,%eax
  86:	7f f0                	jg     78 <itoa+0x40>
  88:	89 f0                	mov    %esi,%eax
  8a:	c6 04 33 00          	movb   $0x0,(%ebx,%esi,1)
  8e:	80 f9 01             	cmp    $0x1,%cl
  91:	89 d9                	mov    %ebx,%ecx
  93:	83 d9 ff             	sbb    $0xffffffff,%ecx
  96:	8d 54 03 ff          	lea    -0x1(%ebx,%eax,1),%edx
  9a:	39 ca                	cmp    %ecx,%edx
  9c:	76 10                	jbe    ae <itoa+0x76>
  9e:	66 90                	xchg   %ax,%ax
  a0:	8a 01                	mov    (%ecx),%al
  a2:	8a 1a                	mov    (%edx),%bl
  a4:	88 19                	mov    %bl,(%ecx)
  a6:	88 02                	mov    %al,(%edx)
  a8:	41                   	inc    %ecx
  a9:	4a                   	dec    %edx
  aa:	39 d1                	cmp    %edx,%ecx
  ac:	72 f2                	jb     a0 <itoa+0x68>
  ae:	89 f0                	mov    %esi,%eax
  b0:	83 c4 14             	add    $0x14,%esp
  b3:	5b                   	pop    %ebx
  b4:	5e                   	pop    %esi
  b5:	5f                   	pop    %edi
  b6:	5d                   	pop    %ebp
  b7:	c3                   	ret    
  b8:	c6 02 30             	movb   $0x30,(%edx)
  bb:	c6 42 01 00          	movb   $0x0,0x1(%edx)
  bf:	b8 01 00 00 00       	mov    $0x1,%eax
  c4:	83 c4 14             	add    $0x14,%esp
  c7:	5b                   	pop    %ebx
  c8:	5e                   	pop    %esi
  c9:	5f                   	pop    %edi
  ca:	5d                   	pop    %ebp
  cb:	c3                   	ret    
  cc:	31 c0                	xor    %eax,%eax
  ce:	80 3a 00             	cmpb   $0x0,(%edx)
  d1:	74 08                	je     db <itoa+0xa3>
  d3:	90                   	nop
  d4:	40                   	inc    %eax
  d5:	80 3c 03 00          	cmpb   $0x0,(%ebx,%eax,1)
  d9:	75 f9                	jne    d4 <itoa+0x9c>
  db:	b2 2d                	mov    $0x2d,%dl
  dd:	b9 9b 04 00 00       	mov    $0x49b,%ecx
  e2:	29 c1                	sub    %eax,%ecx
  e4:	88 14 03             	mov    %dl,(%ebx,%eax,1)
  e7:	40                   	inc    %eax
  e8:	8a 14 01             	mov    (%ecx,%eax,1),%dl
  eb:	84 d2                	test   %dl,%dl
  ed:	75 f5                	jne    e4 <itoa+0xac>
  ef:	b8 0b 00 00 00       	mov    $0xb,%eax
  f4:	83 c4 14             	add    $0x14,%esp
  f7:	5b                   	pop    %ebx
  f8:	5e                   	pop    %esi
  f9:	5f                   	pop    %edi
  fa:	5d                   	pop    %ebp
  fb:	c3                   	ret    
  fc:	c6 02 2d             	movb   $0x2d,(%edx)
  ff:	f7 d8                	neg    %eax
 101:	be 01 00 00 00       	mov    $0x1,%esi
 106:	b1 01                	mov    $0x1,%cl
 108:	e9 6b ff ff ff       	jmp    78 <itoa+0x40>
 10d:	89 d1                	mov    %edx,%ecx
 10f:	31 f6                	xor    %esi,%esi
 111:	31 c0                	xor    %eax,%eax
 113:	eb 81                	jmp    96 <itoa+0x5e>
 115:	8d 76 00             	lea    0x0(%esi),%esi

00000118 <strlen>:
 118:	55                   	push   %ebp
 119:	89 e5                	mov    %esp,%ebp
 11b:	8b 55 08             	mov    0x8(%ebp),%edx
 11e:	31 c0                	xor    %eax,%eax
 120:	80 3a 00             	cmpb   $0x0,(%edx)
 123:	74 0a                	je     12f <strlen+0x17>
 125:	8d 76 00             	lea    0x0(%esi),%esi
 128:	40                   	inc    %eax
 129:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 12d:	75 f9                	jne    128 <strlen+0x10>
 12f:	5d                   	pop    %ebp
 130:	c3                   	ret    
 131:	8d 76 00             	lea    0x0(%esi),%esi

00000134 <strcpy>:
 134:	55                   	push   %ebp
 135:	89 e5                	mov    %esp,%ebp
 137:	8b 45 0c             	mov    0xc(%ebp),%eax
 13a:	8a 10                	mov    (%eax),%dl
 13c:	84 d2                	test   %dl,%dl
 13e:	74 0e                	je     14e <strcpy+0x1a>
 140:	8b 4d 08             	mov    0x8(%ebp),%ecx
 143:	40                   	inc    %eax
 144:	88 11                	mov    %dl,(%ecx)
 146:	8a 10                	mov    (%eax),%dl
 148:	41                   	inc    %ecx
 149:	40                   	inc    %eax
 14a:	84 d2                	test   %dl,%dl
 14c:	75 f6                	jne    144 <strcpy+0x10>
 14e:	5d                   	pop    %ebp
 14f:	c3                   	ret    

00000150 <strcat>:
 150:	55                   	push   %ebp
 151:	89 e5                	mov    %esp,%ebp
 153:	53                   	push   %ebx
 154:	8b 5d 08             	mov    0x8(%ebp),%ebx
 157:	8b 55 0c             	mov    0xc(%ebp),%edx
 15a:	31 c0                	xor    %eax,%eax
 15c:	80 3b 00             	cmpb   $0x0,(%ebx)
 15f:	74 0a                	je     16b <strcat+0x1b>
 161:	8d 76 00             	lea    0x0(%esi),%esi
 164:	40                   	inc    %eax
 165:	80 3c 03 00          	cmpb   $0x0,(%ebx,%eax,1)
 169:	75 f9                	jne    164 <strcat+0x14>
 16b:	8a 0a                	mov    (%edx),%cl
 16d:	84 c9                	test   %cl,%cl
 16f:	74 0d                	je     17e <strcat+0x2e>
 171:	01 d8                	add    %ebx,%eax
 173:	42                   	inc    %edx
 174:	88 08                	mov    %cl,(%eax)
 176:	8a 0a                	mov    (%edx),%cl
 178:	40                   	inc    %eax
 179:	42                   	inc    %edx
 17a:	84 c9                	test   %cl,%cl
 17c:	75 f6                	jne    174 <strcat+0x24>
 17e:	5b                   	pop    %ebx
 17f:	5d                   	pop    %ebp
 180:	c3                   	ret    
 181:	8d 76 00             	lea    0x0(%esi),%esi

00000184 <syscall>:
 184:	55                   	push   %ebp
 185:	89 e5                	mov    %esp,%ebp
 187:	53                   	push   %ebx
 188:	8b 55 14             	mov    0x14(%ebp),%edx
 18b:	8b 4d 10             	mov    0x10(%ebp),%ecx
 18e:	8b 45 08             	mov    0x8(%ebp),%eax
 191:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 194:	cd 80                	int    $0x80
 196:	5b                   	pop    %ebx
 197:	5d                   	pop    %ebp
 198:	c3                   	ret    
 199:	8d 76 00             	lea    0x0(%esi),%esi

0000019c <printf>:
 19c:	55                   	push   %ebp
 19d:	89 e5                	mov    %esp,%ebp
 19f:	57                   	push   %edi
 1a0:	56                   	push   %esi
 1a1:	53                   	push   %ebx
 1a2:	81 ec 4c 01 00 00    	sub    $0x14c,%esp
 1a8:	b9 40 00 00 00       	mov    $0x40,%ecx
 1ad:	31 c0                	xor    %eax,%eax
 1af:	8d bd f4 fe ff ff    	lea    -0x10c(%ebp),%edi
 1b5:	f3 ab                	rep stos %eax,%es:(%edi)
 1b7:	8d 45 0c             	lea    0xc(%ebp),%eax
 1ba:	89 c6                	mov    %eax,%esi
 1bc:	8b 45 08             	mov    0x8(%ebp),%eax
 1bf:	8a 00                	mov    (%eax),%al
 1c1:	84 c0                	test   %al,%al
 1c3:	0f 84 6f 01 00 00    	je     338 <printf+0x19c>
 1c9:	c7 85 b0 fe ff ff 00 	movl   $0x0,-0x150(%ebp)
 1d0:	00 00 00 
 1d3:	8d 9d f4 fe ff ff    	lea    -0x10c(%ebp),%ebx
 1d9:	eb 1e                	jmp    1f9 <printf+0x5d>
 1db:	90                   	nop
 1dc:	88 03                	mov    %al,(%ebx)
 1de:	43                   	inc    %ebx
 1df:	ff 85 b0 fe ff ff    	incl   -0x150(%ebp)
 1e5:	8b 85 b0 fe ff ff    	mov    -0x150(%ebp),%eax
 1eb:	8b 7d 08             	mov    0x8(%ebp),%edi
 1ee:	8a 04 07             	mov    (%edi,%eax,1),%al
 1f1:	84 c0                	test   %al,%al
 1f3:	0f 84 3f 01 00 00    	je     338 <printf+0x19c>
 1f9:	3c 25                	cmp    $0x25,%al
 1fb:	75 df                	jne    1dc <printf+0x40>
 1fd:	ff 85 b0 fe ff ff    	incl   -0x150(%ebp)
 203:	8b 95 b0 fe ff ff    	mov    -0x150(%ebp),%edx
 209:	b9 21 00 00 00       	mov    $0x21,%ecx
 20e:	31 c0                	xor    %eax,%eax
 210:	8d bd d3 fe ff ff    	lea    -0x12d(%ebp),%edi
 216:	f3 aa                	rep stos %al,%es:(%edi)
 218:	8b 4d 08             	mov    0x8(%ebp),%ecx
 21b:	8a 14 11             	mov    (%ecx,%edx,1),%dl
 21e:	80 fa 64             	cmp    $0x64,%dl
 221:	0f 84 55 01 00 00    	je     37c <printf+0x1e0>
 227:	7f 1b                	jg     244 <printf+0xa8>
 229:	80 fa 25             	cmp    $0x25,%dl
 22c:	74 b1                	je     1df <printf+0x43>
 22e:	80 fa 63             	cmp    $0x63,%dl
 231:	0f 85 3d 01 00 00    	jne    374 <printf+0x1d8>
 237:	8b 06                	mov    (%esi),%eax
 239:	88 03                	mov    %al,(%ebx)
 23b:	83 c6 04             	add    $0x4,%esi
 23e:	43                   	inc    %ebx
 23f:	eb 9e                	jmp    1df <printf+0x43>
 241:	8d 76 00             	lea    0x0(%esi),%esi
 244:	80 fa 73             	cmp    $0x73,%dl
 247:	0f 84 7f 01 00 00    	je     3cc <printf+0x230>
 24d:	80 fa 78             	cmp    $0x78,%dl
 250:	0f 85 1e 01 00 00    	jne    374 <printf+0x1d8>
 256:	8d 7e 04             	lea    0x4(%esi),%edi
 259:	89 bd ac fe ff ff    	mov    %edi,-0x154(%ebp)
 25f:	8b 36                	mov    (%esi),%esi
 261:	89 b5 a8 fe ff ff    	mov    %esi,-0x158(%ebp)
 267:	85 f6                	test   %esi,%esi
 269:	0f 89 b1 01 00 00    	jns    420 <printf+0x284>
 26f:	8d bd ba fe ff ff    	lea    -0x146(%ebp),%edi
 275:	b9 09 00 00 00       	mov    $0x9,%ecx
 27a:	f3 aa                	rep stos %al,%es:(%edi)
 27c:	8d bd c3 fe ff ff    	lea    -0x13d(%ebp),%edi
 282:	be a8 04 00 00       	mov    $0x4a8,%esi
 287:	b9 04 00 00 00       	mov    $0x4,%ecx
 28c:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
 28e:	8b 85 a8 fe ff ff    	mov    -0x158(%ebp),%eax
 294:	89 85 b4 fe ff ff    	mov    %eax,-0x14c(%ebp)
 29a:	8d b5 b4 fe ff ff    	lea    -0x14c(%ebp),%esi
 2a0:	8d 95 ba fe ff ff    	lea    -0x146(%ebp),%edx
 2a6:	8d bd b0 fe ff ff    	lea    -0x150(%ebp),%edi
 2ac:	8a 46 03             	mov    0x3(%esi),%al
 2af:	88 c1                	mov    %al,%cl
 2b1:	c0 e9 04             	shr    $0x4,%cl
 2b4:	0f b6 c9             	movzbl %cl,%ecx
 2b7:	8a 8c 0d c3 fe ff ff 	mov    -0x13d(%ebp,%ecx,1),%cl
 2be:	88 0a                	mov    %cl,(%edx)
 2c0:	83 e0 0f             	and    $0xf,%eax
 2c3:	8a 84 05 c3 fe ff ff 	mov    -0x13d(%ebp,%eax,1),%al
 2ca:	88 42 01             	mov    %al,0x1(%edx)
 2cd:	4e                   	dec    %esi
 2ce:	83 c2 02             	add    $0x2,%edx
 2d1:	39 f7                	cmp    %esi,%edi
 2d3:	75 d7                	jne    2ac <printf+0x110>
 2d5:	8a 8d ba fe ff ff    	mov    -0x146(%ebp),%cl
 2db:	84 c9                	test   %cl,%cl
 2dd:	74 1e                	je     2fd <printf+0x161>
 2df:	31 c0                	xor    %eax,%eax
 2e1:	8d 76 00             	lea    0x0(%esi),%esi
 2e4:	88 8c 05 d3 fe ff ff 	mov    %cl,-0x12d(%ebp,%eax,1)
 2eb:	40                   	inc    %eax
 2ec:	8a 8c 05 ba fe ff ff 	mov    -0x146(%ebp,%eax,1),%cl
 2f3:	84 c9                	test   %cl,%cl
 2f5:	75 ed                	jne    2e4 <printf+0x148>
 2f7:	8a 8d d3 fe ff ff    	mov    -0x12d(%ebp),%cl
 2fd:	b8 08 00 00 00       	mov    $0x8,%eax
 302:	31 d2                	xor    %edx,%edx
 304:	80 3b 00             	cmpb   $0x0,(%ebx)
 307:	74 0a                	je     313 <printf+0x177>
 309:	8d 76 00             	lea    0x0(%esi),%esi
 30c:	42                   	inc    %edx
 30d:	80 3c 13 00          	cmpb   $0x0,(%ebx,%edx,1)
 311:	75 f9                	jne    30c <printf+0x170>
 313:	84 c9                	test   %cl,%cl
 315:	74 13                	je     32a <printf+0x18e>
 317:	01 da                	add    %ebx,%edx
 319:	8d b5 d4 fe ff ff    	lea    -0x12c(%ebp),%esi
 31f:	90                   	nop
 320:	88 0a                	mov    %cl,(%edx)
 322:	8a 0e                	mov    (%esi),%cl
 324:	42                   	inc    %edx
 325:	46                   	inc    %esi
 326:	84 c9                	test   %cl,%cl
 328:	75 f6                	jne    320 <printf+0x184>
 32a:	01 c3                	add    %eax,%ebx
 32c:	8b b5 ac fe ff ff    	mov    -0x154(%ebp),%esi
 332:	e9 a8 fe ff ff       	jmp    1df <printf+0x43>
 337:	90                   	nop
 338:	31 c9                	xor    %ecx,%ecx
 33a:	31 d2                	xor    %edx,%edx
 33c:	80 bd f4 fe ff ff 00 	cmpb   $0x0,-0x10c(%ebp)
 343:	74 10                	je     355 <printf+0x1b9>
 345:	8d 76 00             	lea    0x0(%esi),%esi
 348:	41                   	inc    %ecx
 349:	89 ca                	mov    %ecx,%edx
 34b:	80 bc 0d f4 fe ff ff 	cmpb   $0x0,-0x10c(%ebp,%ecx,1)
 352:	00 
 353:	75 f3                	jne    348 <printf+0x1ac>
 355:	bb 01 00 00 00       	mov    $0x1,%ebx
 35a:	b8 04 00 00 00       	mov    $0x4,%eax
 35f:	8d 8d f4 fe ff ff    	lea    -0x10c(%ebp),%ecx
 365:	cd 80                	int    $0x80
 367:	81 c4 4c 01 00 00    	add    $0x14c,%esp
 36d:	5b                   	pop    %ebx
 36e:	5e                   	pop    %esi
 36f:	5f                   	pop    %edi
 370:	5d                   	pop    %ebp
 371:	c3                   	ret    
 372:	66 90                	xchg   %ax,%ax
 374:	88 13                	mov    %dl,(%ebx)
 376:	43                   	inc    %ebx
 377:	e9 63 fe ff ff       	jmp    1df <printf+0x43>
 37c:	89 f0                	mov    %esi,%eax
 37e:	83 c6 04             	add    $0x4,%esi
 381:	b9 0a 00 00 00       	mov    $0xa,%ecx
 386:	8d 95 d3 fe ff ff    	lea    -0x12d(%ebp),%edx
 38c:	8b 00                	mov    (%eax),%eax
 38e:	e8 a5 fc ff ff       	call   38 <itoa>
 393:	31 d2                	xor    %edx,%edx
 395:	80 3b 00             	cmpb   $0x0,(%ebx)
 398:	74 09                	je     3a3 <printf+0x207>
 39a:	66 90                	xchg   %ax,%ax
 39c:	42                   	inc    %edx
 39d:	80 3c 13 00          	cmpb   $0x0,(%ebx,%edx,1)
 3a1:	75 f9                	jne    39c <printf+0x200>
 3a3:	8a 8d d3 fe ff ff    	mov    -0x12d(%ebp),%cl
 3a9:	84 c9                	test   %cl,%cl
 3ab:	74 15                	je     3c2 <printf+0x226>
 3ad:	01 da                	add    %ebx,%edx
 3af:	8d bd d4 fe ff ff    	lea    -0x12c(%ebp),%edi
 3b5:	8d 76 00             	lea    0x0(%esi),%esi
 3b8:	88 0a                	mov    %cl,(%edx)
 3ba:	8a 0f                	mov    (%edi),%cl
 3bc:	42                   	inc    %edx
 3bd:	47                   	inc    %edi
 3be:	84 c9                	test   %cl,%cl
 3c0:	75 f6                	jne    3b8 <printf+0x21c>
 3c2:	01 c3                	add    %eax,%ebx
 3c4:	e9 16 fe ff ff       	jmp    1df <printf+0x43>
 3c9:	8d 76 00             	lea    0x0(%esi),%esi
 3cc:	8d 46 04             	lea    0x4(%esi),%eax
 3cf:	89 85 ac fe ff ff    	mov    %eax,-0x154(%ebp)
 3d5:	8b 0e                	mov    (%esi),%ecx
 3d7:	31 c0                	xor    %eax,%eax
 3d9:	80 3b 00             	cmpb   $0x0,(%ebx)
 3dc:	74 09                	je     3e7 <printf+0x24b>
 3de:	66 90                	xchg   %ax,%ax
 3e0:	40                   	inc    %eax
 3e1:	80 3c 03 00          	cmpb   $0x0,(%ebx,%eax,1)
 3e5:	75 f9                	jne    3e0 <printf+0x244>
 3e7:	8a 11                	mov    (%ecx),%dl
 3e9:	84 d2                	test   %dl,%dl
 3eb:	74 50                	je     43d <printf+0x2a1>
 3ed:	01 d8                	add    %ebx,%eax
 3ef:	8d 79 01             	lea    0x1(%ecx),%edi
 3f2:	66 90                	xchg   %ax,%ax
 3f4:	88 10                	mov    %dl,(%eax)
 3f6:	8a 17                	mov    (%edi),%dl
 3f8:	40                   	inc    %eax
 3f9:	47                   	inc    %edi
 3fa:	84 d2                	test   %dl,%dl
 3fc:	75 f6                	jne    3f4 <printf+0x258>
 3fe:	80 39 00             	cmpb   $0x0,(%ecx)
 401:	74 3a                	je     43d <printf+0x2a1>
 403:	31 c0                	xor    %eax,%eax
 405:	8d 76 00             	lea    0x0(%esi),%esi
 408:	40                   	inc    %eax
 409:	89 c6                	mov    %eax,%esi
 40b:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 40f:	75 f7                	jne    408 <printf+0x26c>
 411:	01 f3                	add    %esi,%ebx
 413:	8b b5 ac fe ff ff    	mov    -0x154(%ebp),%esi
 419:	e9 c1 fd ff ff       	jmp    1df <printf+0x43>
 41e:	66 90                	xchg   %ax,%ax
 420:	b9 10 00 00 00       	mov    $0x10,%ecx
 425:	8d 95 d3 fe ff ff    	lea    -0x12d(%ebp),%edx
 42b:	89 f0                	mov    %esi,%eax
 42d:	e8 06 fc ff ff       	call   38 <itoa>
 432:	8a 8d d3 fe ff ff    	mov    -0x12d(%ebp),%cl
 438:	e9 c5 fe ff ff       	jmp    302 <printf+0x166>
 43d:	31 f6                	xor    %esi,%esi
 43f:	eb d0                	jmp    411 <printf+0x275>
 441:	8d 76 00             	lea    0x0(%esi),%esi

00000444 <fork>:
 444:	55                   	push   %ebp
 445:	89 e5                	mov    %esp,%ebp
 447:	53                   	push   %ebx
 448:	31 c9                	xor    %ecx,%ecx
 44a:	b8 02 00 00 00       	mov    $0x2,%eax
 44f:	89 cb                	mov    %ecx,%ebx
 451:	89 ca                	mov    %ecx,%edx
 453:	cd 80                	int    $0x80
 455:	5b                   	pop    %ebx
 456:	5d                   	pop    %ebp
 457:	c3                   	ret    

00000458 <sleep>:
 458:	55                   	push   %ebp
 459:	89 e5                	mov    %esp,%ebp
 45b:	53                   	push   %ebx
 45c:	31 c9                	xor    %ecx,%ecx
 45e:	b8 05 00 00 00       	mov    $0x5,%eax
 463:	89 cb                	mov    %ecx,%ebx
 465:	89 ca                	mov    %ecx,%edx
 467:	cd 80                	int    $0x80
 469:	5b                   	pop    %ebx
 46a:	5d                   	pop    %ebp
 46b:	c3                   	ret    

0000046c <exit>:
 46c:	55                   	push   %ebp
 46d:	89 e5                	mov    %esp,%ebp
 46f:	53                   	push   %ebx
 470:	31 c9                	xor    %ecx,%ecx
 472:	b8 01 00 00 00       	mov    $0x1,%eax
 477:	89 cb                	mov    %ecx,%ebx
 479:	89 ca                	mov    %ecx,%edx
 47b:	cd 80                	int    $0x80
 47d:	5b                   	pop    %ebx
 47e:	5d                   	pop    %ebp
 47f:	c3                   	ret    

00000480 <getpid>:
 480:	55                   	push   %ebp
 481:	89 e5                	mov    %esp,%ebp
 483:	53                   	push   %ebx
 484:	31 c9                	xor    %ecx,%ecx
 486:	b8 06 00 00 00       	mov    $0x6,%eax
 48b:	89 cb                	mov    %ecx,%ebx
 48d:	89 ca                	mov    %ecx,%edx
 48f:	cd 80                	int    $0x80
 491:	5b                   	pop    %ebx
 492:	5d                   	pop    %ebp
 493:	c3                   	ret    
