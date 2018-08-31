<?php

namespace App\Controller;

use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\Routing\Annotation\Route;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;

class TestController extends Controller
{
    /**
     * @Route("/api/testX", methods={"GET"})
     */
    public function getTest()
    {
        return new JsonResponse(['data' => 'test2']);
    }
}
